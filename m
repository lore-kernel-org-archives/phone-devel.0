Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE18C30C168
	for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 15:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779809409; cv=none; b=X7xq4p5/Yz6Ur67WlhhUXzHPBOmfvTXJjiBxDK4qGmKZ1OIRUi35xN2OcKqPBxHZJnLRxAo3gsAdt0/bn1jICR9Xa3bS2XKv6uADRdkPW6L33AJdlhSU4aFfF/jW/4/ExxlPlwYdjPtPrRhri1bH1eYWOWviqfqMGkxHW456At0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779809409; c=relaxed/simple;
	bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pamXmDXb+gVm/geRozbCwguL5iNSIeCWq61axH2Phaip3XX6sukHNjh3gl/hYTUCSanAi/dnvHJdwiDLsmHKtwdfWUz3bug37MoH5fDLc3zrfJ9vko97Wl6EYzt7zGINfbB9cbTsOMhFwNsw+LPgBh4M9XrfuMjEx09pIXmsfCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=zC21jxOL; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="zC21jxOL"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45e9f4a3510so3040386f8f.1
        for <phone-devel@vger.kernel.org>; Tue, 26 May 2026 08:30:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1779809402; x=1780414202; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=zC21jxOLAGFNXO/HHhONuDs2YGouoRLpPQP9jYirJdq4MDkDmVgbc2+3tD+xQLnHc0
         0UCFzqLNQ66w2/UU+0SsE1osKpNh0dxfwmeZIddv+G+ZD8ef2QSW2USsVnyuKgckEh6r
         zkhEZFDO6ee+0N4o/Na0v0pLiyECKDcExkZHXIfxJw65rTGe7uF4mM6OHL6mdq8aB0v2
         5g/KENckNW46rOGAq4oprX6Ta+F21F2Sz+t+yrDb4jegTXS8XRO6DgFBDLHjhumKMcaP
         /v7qnFgQ+IXHnDe5AcaVQp8rZQSZswrg5uyGywKlJTZ/AtRKysdcXWl/BbLr/aVHRzb9
         xgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779809402; x=1780414202;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9Izp9MZRfDJ61whqJr+eGkWfgZt9VEoIk4csFEn366E=;
        b=hu0oqKkqiBqV65PbUcTsTnzHzVF5e1lNGnMFzoxAPIdd4uCsaWdBLo3lCwEthT4J38
         HfM7F8zrdf6IlFzU37Jo1fPnkdWGeJFdNSs0JjcBDh2K+a3N5GOm6f6CobIc7CqAAlmz
         OhGbSzYO6wCaPOnpFLAePf4Mv5odCbnJ4ilPQWcbuiF/KW/qQDMloSWcJ5qTGddMfAZV
         /VKc7Yq4h1o8lk+tEwgRapexOdAwtF1KV7bP2wTI2VgPM0IPb+KmcrkC88ESj+vEczqM
         aQspMO+DWGVND2KqBcD5883TYR8S8YTWAhi5l7h1H7dAMyELIF6VyK3Cl7ZPcNzbDoem
         TWJA==
X-Forwarded-Encrypted: i=1; AFNElJ9hvB6ITq9bnZPwN1dasd1UbpIXGhkro7iuF+fw8Nb4+FLnOEoeyEneDcABpJw2pgs0gblQIe94bHrWvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwXBzsjcMkm5mcopMJzGsmQB/RTpO5GJgCJ9GT7L537fL7hgvrb
	xvMRPcCHXwD/UNTZ6OFa3WN3Y4Zv+aD8146++JDSI/MDTF/o8ZqMpIAw50wMh9p/uBo=
X-Gm-Gg: Acq92OHh+TFC9BO2ihDzSDBMXwC0fSq5ci5zxBIAbGico329m4Y9Zw24X+FMNuUHZ4v
	LTJftsz2iTTnkNpFz7AJwnHJ+EtPOH2nFGiUISaIkYvEr3v7TQxYdd+ZReVXcYeRclgzkzDlLnp
	zc58DzamB9uNm2KMwCoM5LT+xyvbbprjyU9XlDC9ePi3TGwQZ8RqFTmqZ62qg3tKgv1JZZG9fS7
	A96LDO4Yi3o+VOb/JYza0MrzYxeoqqHIvsqSfzvtWZwdTv684scJALm2KrhRUpOwOnXUVGfwKwX
	mozUQMGgaivswV93ZpdRR7L1sb8f2UIZIsu7Wu1pJRk8NHxb+M2J3d/ywIttr2sGh0PpGVgO/qV
	bzJkynLhQZPs4yHZVbHv3vnUK/S8Zgnd2E3SuG+OuKroHyJ/v+COb0U++XgNIxkorsVnWtK51QY
	eOmd1X3UlBvJ+WUHALM0UVopxP8kp6hMli
X-Received: by 2002:a05:6000:25fd:b0:43c:fa96:d939 with SMTP id ffacd0b85a97d-45eb38a66f0mr30090550f8f.22.1779809402180;
        Tue, 26 May 2026 08:30:02 -0700 (PDT)
Received: from [10.107.1.102] ([212.133.41.39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5caeesm37691140f8f.29.2026.05.26.08.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:30:01 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 26 May 2026 17:29:54 +0200
Subject: [PATCH RFC 1/2] ASoC: codecs: lpass-tx-macro: Use correct config
 for sc7280
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-sc7280-tx-macro-v1-1-1aad6900fec0@fairphone.com>
References: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
In-Reply-To: <20260526-sc7280-tx-macro-v1-0-1aad6900fec0@fairphone.com>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779809398; l=1167;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=d5No5p2kPGYPEeCcwPbvtzn0vYshvW4XXLjtHG58mNs=;
 b=uAdZLNZsfUX4RLp9inUuLMDBsGewFvqrwfJwhlCgMSPgkhFLi8YtiiUMO4qU+M5ZSEnUl9sda
 vCC7PvpT73ODFseHSnV08jqTGnUAaQpiKw5RTnjNyzscsY3xst+kPOQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

With the v9 data, the controls will have completely wrong names and
using wrong code paths that do not apply to v9.4.

Note, that this will change control names so it's a breaking change.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/lpass-tx-macro.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index f7d168f557dd..7f93ab0c3872 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2493,14 +2493,9 @@ static const struct tx_macro_data lpass_ver_11 = {
 
 static const struct of_device_id tx_macro_dt_match[] = {
 	{
-		/*
-		 * The block is actually LPASS v9.4, but keep LPASS v9 match
-		 * data and audio widgets, due to compatibility reasons.
-		 * Microphones are working on SC7280 fine, so apparently the fix
-		 * is not necessary.
-		 */
 		.compatible = "qcom,sc7280-lpass-tx-macro",
-		.data = &lpass_ver_9,
+		/* LPASS v9.4 */
+		.data = &lpass_ver_9_2,
 	}, {
 		.compatible = "qcom,sm6115-lpass-tx-macro",
 		.data = &lpass_ver_10_sm6115,

-- 
2.54.0

