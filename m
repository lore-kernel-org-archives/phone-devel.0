Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA912E0B7B
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 09:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842914; cv=none; b=Og72R5P3G7zBXOdS3Lcz6uiJISgfF9nzgj5KsS3+fVgojfVa1U7d+a2V0X2KuPVGWIy/a+2cuVsJEPjyrqsvcnnsrgy8CYaFu7Bb6BCLYcTrnVPg8WCDw2RmIPpdHx6bywAYUXKzHA+/5uaIVN3zlm74QrFa46GatRfiB2cXDAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842914; c=relaxed/simple;
	bh=ir+Zz4LAiE20eWLdniulU6V2vglQQAqVFBeR34CuJG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iSpqU9YFZ225hoxUuzVgLORKsxfC5MrSoi+ay1Zc+x2l/kPeVh30T0exTgsyhjgRY6eGAWb87f9l6Wdb64SMDRiV2S0ptgHa2psbZ0cZhlbymKOZDTLdl6OggJO3sG2SJx1Hl7yz3xU6481EJw/eDoZrlcX0iS9wJyWht7UYv8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=YTL6lVrz; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="YTL6lVrz"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae04d3d63e6so843017366b.2
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 02:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842909; x=1751447709; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nYAqoJ6/qKfU25b7tBm6m33uYwBP9NEeRrfJuuX4YuU=;
        b=YTL6lVrzYphYfdhGazJaPcyGhrbntdl0ZT4UesLGNWKnmKT4VNHxRzkMpYe5aA63hn
         8mgKo47mz5CTV18ccPkCpopn5AlcCsA1VU/74DW8UHOmhygxZWakUdaVD19S1Mouowdt
         Ffisl5vw/rvhpfGqithp07Y3mVxRdS9YQqPD+eAikgCvOWBu3Vb8JUjvCyiAINsB9MGx
         Gy6pKAqRK7xx/bnBidFrzEsvpjQMmGG4LuXnnxvwTxsrPB4oy5kE+Dn+HANwCwwrQhpM
         6xGOcoNNpgshZphwxz4XmwX+BYKQQDKtN/ifbPd6mzUvUlAU4pJ3P+BDZknEgLPscplK
         QJUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842909; x=1751447709;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nYAqoJ6/qKfU25b7tBm6m33uYwBP9NEeRrfJuuX4YuU=;
        b=WdJhW6lsBbYea+4kuIfItvN4LWNbWusdkFV9nXtCTSelIe2zcINhbkboSZWAjEC/Es
         AgFJ+55K6QdMTzHWyhSeMIu43PBwP+HIJhQ4gNiWVjBbtat7h1ZYWilr51iy48XRF0XZ
         +/WTc8rYevXzoUOz0TC/EspkCsLghQEhLxx+QdYmgzjlMb9vz04Pd20nC7pPCsmSWqMo
         p6WmzKOVgcEYR0JDsR9KmITAGgdoRg4Rte3ZCCvgE6XGKvu8B7iio/Q6JAGdt1HHmAqn
         08YBxb2hWKvfQEikmjuGjzuVHUb62aMdy56TD1VfGaGZ9D/W7BhaYfBKa6bHP8jhHnC0
         0soQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6S5DjhbzkqZwphNzCnC2g+9j2CWu0mdA29QHn/sOSVROWg+x4Ob8AgbAJRLL5MSuq8l+OqMx7pPSf/Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyROME8jj5/mw4wOgO/SswuuENebxt/5d+IuE2w15M/8+3alPc+
	fi+glzxefMuYUqDSKy1Yu3cr6wc+vmHyFc47W9kbKKYhhb2fsW1xJzen7DjZnpKCGZw=
X-Gm-Gg: ASbGncsqOu0Y38crXxxahyePiC8fKqXiVEIA9oA5NjfdbdhbtxhRUImkgjyh+I8R+Cx
	LvfNCFt1hyx2S4DN1mtQUkZJSHV/t+UllH89U2Xg6wr7bFka7GqvhRqrZemHb2AEvvECVVMam+p
	F0lj9nnx07ywM2CdzAJmjiwgW07WC1vl3qSIgCfIyyQA0guvxQFB//KLn1LbEg0slfSXPsb0+VC
	jQb1aebRSj/z+lKqkTGKmai/NKxcdn9XHl+hGcaIpERBlAoK5ZLDVVNOe8FsgJcod+k79NeYOf5
	W9FqJXMuSettNM/xC/acR5BR8Wvpdujn9bFv5B4jAUWRwpuClJT3J/+6Mpo1SRmaoGGhZs8stqj
	70lKnMU/XrBYFgToxOhJpnNxcuC1k23QU
X-Google-Smtp-Source: AGHT+IHTHT6smOWuvPBbg/OoSpzrmO4I1vDkFCL1KQ1NKNgVDgQsVVmwWjvkBuZNA/03futIChe+uA==
X-Received: by 2002:a17:906:8f03:b0:ad5:430b:9013 with SMTP id a640c23a62f3a-ae0beabad4cmr197343066b.42.1750842909404;
        Wed, 25 Jun 2025 02:15:09 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4c2bsm1008972266b.71.2025.06.25.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:15:08 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:59 +0200
Subject: [PATCH 4/4] phy: qualcomm: phy-qcom-eusb2-repeater: Add support
 for PMIV0104
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-repeater-v1-4-19d85541eb4c@fairphone.com>
References: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-repeater-v1-0-19d85541eb4c@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842904; l=1626;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=ir+Zz4LAiE20eWLdniulU6V2vglQQAqVFBeR34CuJG8=;
 b=poF4UgGeNsIdsHzqa+4Ufcgj3UOwUXQ9heUHTSr0dnvLoBGTxC7sTPQsPYsEOBqNDzaIkqivb
 0Pe8NuBzS+DChDjGAvuxbBPb93e/Hf1JOEeKajCAGwAwTabDEokAhcp
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add support for the eUSB2 repeater found on the PMIV0104. There is no
default init table for this PMIC, just the board-specific tuning
parameters are used on top of the default tuning values.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
index 61594739e5b12706775622e1f76af6ad5d2d29bf..3d4cdc4c18becd8efd5015e698b836ad4d7cf18c 100644
--- a/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
+++ b/drivers/phy/qualcomm/phy-qcom-eusb2-repeater.c
@@ -82,6 +82,14 @@ static const struct eusb2_repeater_cfg pm8550b_eusb2_cfg = {
 	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
 };
 
+static const struct eusb2_repeater_cfg pmiv0104_eusb2_cfg = {
+	/* No PMIC-specific init sequence, only board level tuning via DT */
+	.init_tbl	= (struct eusb2_repeater_init_tbl_reg[]) {},
+	.init_tbl_num	= 0,
+	.vreg_list	= pm8550b_vreg_l,
+	.num_vregs	= ARRAY_SIZE(pm8550b_vreg_l),
+};
+
 static const struct eusb2_repeater_cfg smb2360_eusb2_cfg = {
 	.init_tbl	= smb2360_init_tbl,
 	.init_tbl_num	= ARRAY_SIZE(smb2360_init_tbl),
@@ -264,6 +272,10 @@ static const struct of_device_id eusb2_repeater_of_match_table[] = {
 		.compatible = "qcom,pm8550b-eusb2-repeater",
 		.data = &pm8550b_eusb2_cfg,
 	},
+	{
+		.compatible = "qcom,pmiv0104-eusb2-repeater",
+		.data = &pmiv0104_eusb2_cfg,
+	},
 	{
 		.compatible = "qcom,smb2360-eusb2-repeater",
 		.data = &smb2360_eusb2_cfg,

-- 
2.50.0

