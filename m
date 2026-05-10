Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC3B37BE65
	for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778406487; cv=none; b=F6L2QnCbhd9a8SAaSJVDm1EQjMlT7msjWLs2sX6271gkBGvxYbCCQW29cctYOZ7ugUAqw35jI0x3+Ib05ioOFKKA+MdKfYgcuaIjTYpiTS7M4RgOhGiNakDr5fXDAON/UoeWPrIHB9E83qcn17AysBIA4+n0guMuY5HV9xDU7PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778406487; c=relaxed/simple;
	bh=u1ZxeAc19H3I75eYjPO22qxUQ5RQA6sI/ieAA9yHFvU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YSLPBwUhkR7PHYwL+bKcH5j/Ng+4u5JFaIi51flBpcTQtBGmQGK++dFbt7vSxC9cFSwLCbulYKeQxbV+PCcX8vo+dE9q9Zu/EWZj93pwlNJAGrWuaPYUZE2chR8zCqrI8LowqorbNU26uKHPFvp85mhSepqySeTFG8ikmWi76Fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF3LGAsf; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF3LGAsf"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488ad135063so26875105e9.0
        for <phone-devel@vger.kernel.org>; Sun, 10 May 2026 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778406483; x=1779011283; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=lF3LGAsfl80ehNtg8BrBQyE0KVsNSI9Z/gl1Fc55p7oeMbSvG7MvTEZfywMwlP98wc
         FKGQD87SwGe9PnDexx9bq1fwdB4ZOgQzlmxSuuNrCrNxXrzzhioTMcG5sI9utieidbNO
         ss0oC4fN+NeIgFbf9v7SWFE4djnnpQd6JMUIlF7G1h3qKS5pwBJgX4pi0MNHY1o1C3Au
         nfSywopPsUmVdmJ6TUslR2FwMfEQtMmyAh936QAm63muvTU8rIVvc2FgXxjcgUFaL45P
         94eJEIApjJncidadAPJWHGU8AKwL1FfNPbn8yq6mwweQ1fEwH4pP8L/Bp06e686fp+UJ
         BbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778406483; x=1779011283;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xLO7DOU1ouh67wd4NrLBkCSh/jnFkIqwlgXZjoPnVfo=;
        b=NMBlH/3FS4E4xfpNmcT10yqtOQtYrSpNpmBqsUro+KIuq66LAlTwpHy+NSJLVggRA0
         iQp/22u0Pex0+kr9FxrEQDSkpYUkaH/kt5G4mPfOVXgIRiwT6gKNzVGdaYH4ertjOPBx
         761rY6GtSY/zNfmt/yCGyKtlhBOZahQ0i41Hi+9bbfQ1aOCd/BqNQ2PSDmqo9e0nXrhq
         l+GME5gNwhRULorFBEJR20XM4n2jmn6sTpHouiNK4m2PW46KzEFqqnnnkhqpHmPn0O3X
         pg2Ixj9kTEXUZz09h5JGGKKE4H/Oso6xkucMvecm/O+4IPLNiX+8mAU4K66HP9oeuGrQ
         6V5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/IdYf/N5EYy6GuMi/IPWG+aMrMY2s6gAuWovJF6UVylxuWGVXfV35H10nQYpqif27mAP37MgouqKWGzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzwHmNYImIrAEJYaFYKKp5F8eHE/2ku0qBDqYhFKRmtbZ4i3ThM
	OOKMxMexGab/hnHSJ+S+WJ+Z+tRdA/zFNS+bQ5151UzFXtjEsoTia1uG
X-Gm-Gg: Acq92OHNkN/zYaULiLkLfm5FqpMnSRkLkB9zwXoFqbz2x3ITKW1QUeza/C+fnQGg9/o
	KeMeFyvQu5L7a5ZnvogM1Hzj6j3CyrwVxiKiy+EG/0hgRwdSKiMextY2uyHjKVgT7TfmRDen+cZ
	+G4iKZPTUbo7K5OUl3zv4+mE2DvTG+RsBk/9ozbTPHjc2CMUBT3n2rvxvqN4uCZUUe3wtfocET8
	gzrby/BS3GdSvWpVohrUvNi2G2Acp7twhA077ewU5PUPMCPrZV2w4iFQg6Xkkq6CzZmsg2zSyV6
	CbNihsuVLyXpUaRvzNom2/jSv+5QUk3bIa8zTS1QU8F37Uy6NA7uQOQxrpQCs06X4LJAJaI0KRS
	rGoy1WuIbAumCd7tpdWFKte4T+VdLp7ToQ2pUbod72qSYcecPz/4EYKDDMT3rkqNRRuLN9h9iXt
	pGgwcySlHuoKbwSYAqbxEJufF2aiG4Vf1SEkLv05E=
X-Received: by 2002:a05:600c:8485:b0:48d:5c1:bc47 with SMTP id 5b1f17b1804b1-48e51f32a6fmr330837045e9.15.1778406483419;
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
Received: from [192.168.8.79] ([2a00:f502:160:4e2:a099:cad9:2ecd:93de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702e0bf2sm182807925e9.4.2026.05.10.02.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 02:48:03 -0700 (PDT)
From: Erikas Bitovtas <xerikasxx@gmail.com>
Date: Sun, 10 May 2026 12:47:42 +0300
Subject: [PATCH v6 4/8] arm64: dts: qcom: msm8939-asus-z00t: add Venus
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260510-msm8939-venus-rfc-v6-4-e69465375900@gmail.com>
References: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
In-Reply-To: <20260510-msm8939-venus-rfc-v6-0-e69465375900@gmail.com>
To: Bryan O'Donoghue <bod@kernel.org>, 
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>, 
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Erikas Bitovtas <xerikasxx@gmail.com>
X-Mailer: b4 0.15.2

Enable Venus video encoder/decoder for Asus ZenFone 2 Laser/Selfie.

Default firmware paths work on Asus ZenFone 2 Laser/Selfie, which
means firmware-name property can be left out.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
---
 arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
index 90e966242720..231a3e9c1929 100644
--- a/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
+++ b/arch/arm64/boot/dts/qcom/msm8939-asus-z00t.dts
@@ -267,6 +267,14 @@ &usb_hs_phy {
 	extcon = <&usb_id>;
 };
 
+&venus {
+	status = "okay";
+};
+
+&venus_mem {
+	status = "okay";
+};
+
 &wcnss {
 	status = "okay";
 };

-- 
2.54.0

