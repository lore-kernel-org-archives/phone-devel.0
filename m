Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A792571BE
	for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 13:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768569452; cv=none; b=RwkVbCRI9As22NDSk6qan/dIdC2BVEGHqjfqPWKmn/b7hcMOpIZEnM4TvOOu0bpYO85bnpnjKruJUXzzbt2jWb+fAW2KGzAVOgQaHkapULk6Q0QGdOJt81cvd5MB3U5FgbIMPYFyKwdMa7WGjyVxQGtsbVCgqxNz/8s+lhZlmv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768569452; c=relaxed/simple;
	bh=5i0VsvUcS0SUwOVd0wGHGUe0uBItUE4uGBSE3yIgsYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hxJliHGZW4A4X8A3iCqMTvF0vFo/CJrhi9GpdEZHJxN21KuYWzAfMXelhlfLyA6z2oRkoE2tkTxr/Jpi/QdcQIzoJILTYhvZy8V3LhoDG5yS+6m9H+an4cLLr5I9k0yTbZhEhxSFm0i3ifHvBOsshvLQj3g63Q+bayDgT5sJU4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mOjnHEaQ; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mOjnHEaQ"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-652fdd043f9so3921288a12.1
        for <phone-devel@vger.kernel.org>; Fri, 16 Jan 2026 05:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1768569447; x=1769174247; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=duq39jBoqDFtabq63HAqX5adf5fdfb9r8RBQ2RPSZD0=;
        b=mOjnHEaQ0xxNRyxaRCwgz00PSnpOxde71MA1Cdyi1PZpG1XySlKbhbPekX1OJPrphr
         FBnSrVjmcOvp6VIwJxNpZkarwpgCNFaqwl7PUkzMNSG4VAIORELm6u0O+pw5p9Fe7uKv
         n76OKCHRioCRE3mJXgxGlZwM+tDreLGwshH9yNW7dikStHvDuIBm/qCRxG9hUipKtJV6
         SuMtQqasEkJsxY1h3k/YQBnJq2xQmQfXdmEP8/lfuwflQHgvKGcWPoHCZpbsJUGFTRSA
         FrcopB4CMrUQDykTUbPwZkIgIh4fK5NREzImnnXvShug82Tj82j8k9o3tPdYflJQzFqf
         fEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768569447; x=1769174247;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=duq39jBoqDFtabq63HAqX5adf5fdfb9r8RBQ2RPSZD0=;
        b=W15qpquwXHbgHkOZV4L6AWB2KZ3uhXzz4IHG1gkUhMGjUcsGh4Xu5la1R8Y0YnBbuZ
         ez9fyZ95hil8N64U0rzXhB/4HRcnw9Yi7rTdBiGVA8I04TVdhLA8rtzhfDLqs8zRUI2s
         sw/+tgE36EYW58hZ2deGOYGPWfiGm2Q557byrZVPP/Pah9d2IxPIR7CtiSQpuy/aOmy2
         yT2pV9No65VPI992ZcHb+/DnHFYcNrwoKCJ7XSQwyDEfY6Y6CUyhp9nIPgBbsScJh9CY
         TS1Q8RD0q1zoyZyLgJa6XIna2lZ9P5nU4TIOozq/crOH7h9KOpia3qJWhRRg7OQX3u0C
         nReg==
X-Forwarded-Encrypted: i=1; AJvYcCVQk+ps6CwYRtH+JWiSAoa0gQbLdi02zX6Hiqzmko0o4umamC38PzeRlkcy53PxLV8HN8TOagUGOpDiIA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvyYXly0JBwtqt26nbyRqyL8DBNKGOAehWVW1cQBsqjGJX7RxM
	lXzAxpawP+cpNcSS3jvyMzV41QAZrqWpJLbKlO6618cUgy46VVmZA1N88dg8XdM0Y7AvQplE/oZ
	UhARm
X-Gm-Gg: AY/fxX4lHU0kfVWuSWHCJyiI6GsRs0m3RPDVQAU+58YOqZGjo774yiezmaTkqYK2DF4
	xSH/2bO7w9L+GIysQxw8yPrlERNbnQCK8bB/WEo6SzoQQI3gxg8YscERZuzSy1tCC+UnWQZmSd8
	A55xXEMVcpqPMfgHjW1/h1qH2xdIS3r4OgQDhriNLehE/2Gk9aVnW24tMNVzTS46GSya2KplrjY
	EEEGmsGUFetHlV22QRnMWb6bYwHFmKOUDYqWCvfkWYJcy7pz7IAeISsfjg7LWcH6JRz+0QR1y8Q
	dwbg3htwNVcJ+s0n/uXiC8WvZuMdSNuSxscKo/gsgK+5RF0fxgbwH4PHfai/9+l36zIarSdxjUk
	8bQjdPeXTxV8WUJo/0cGGK/WEGbfOBiv3N8xuW7uaqfHRIB2quBk14cekW6W4VwXcghoH6eZ45o
	hWBgClSHSvckzUXPL04w+5Ot/6oPxBgClsiKHb3+XOkkbmpSVlGji6IVLtwViOdz1S
X-Received: by 2002:a17:907:25c7:b0:b73:398c:c5a7 with SMTP id a640c23a62f3a-b8793008849mr255921666b.41.1768569447170;
        Fri, 16 Jan 2026 05:17:27 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a350dbsm235507366b.69.2026.01.16.05.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 05:17:26 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 16 Jan 2026 14:17:23 +0100
Subject: [PATCH 4/5] clk: qcom: camcc-milos: Declare icc path dependency
 for CAMSS_TOP_GDSC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-milos-camcc-icc-v1-4-400b7fcd156a@fairphone.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
In-Reply-To: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
To: Georgi Djakov <djakov@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768569443; l=942;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5i0VsvUcS0SUwOVd0wGHGUe0uBItUE4uGBSE3yIgsYw=;
 b=pxIbdFvn4Pi8X4MwhDSzKXEcKRx9BJ2hA91ot6BC8vc+Xctsgq8QVNEsD4kc47w1mvuNfbMGT
 fbkIhmEQvCTC+X+GuHJJaZKe/3EgLXqaOD5082PO4UqZCO8X7y851YF
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

This GDSC requires an interconnect path to be enabled, otherwise the
GDSC will be stuck on 'off' and can't be enabled.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/clk/qcom/camcc-milos.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/qcom/camcc-milos.c b/drivers/clk/qcom/camcc-milos.c
index 0077c9c9249f..45e68165a2f0 100644
--- a/drivers/clk/qcom/camcc-milos.c
+++ b/drivers/clk/qcom/camcc-milos.c
@@ -30,6 +30,11 @@ enum {
 	DT_IFACE,
 };
 
+/* Need to match the order of interconnects in DT binding */
+enum {
+	DT_ICC_TOP_GDSC,
+};
+
 enum {
 	P_BI_TCXO,
 	P_CAM_CC_PLL0_OUT_EVEN,
@@ -1971,6 +1976,8 @@ static struct gdsc cam_cc_camss_top_gdsc = {
 	},
 	.pwrsts = PWRSTS_OFF_ON,
 	.flags = POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
+	.needs_icc = true,
+	.icc_path_index = DT_ICC_TOP_GDSC,
 };
 
 static struct clk_regmap *cam_cc_milos_clocks[] = {

-- 
2.52.0

