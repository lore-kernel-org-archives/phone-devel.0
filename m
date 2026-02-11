Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72EB436921B
	for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 10:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770805672; cv=none; b=H3kw1LrNbqwKcb3K5GBvb8X9RytNMey6qwq2yB+mxrjU8lstJ23OnGkFx2WriNoF5X/Fn0pgwyEk2VJFkoVcf92M7XYPzP5qBXpWsLPO+95LCwCM0Lh64d7pF2z7wRwcxuKMUzHFwTf93veTuCORAouB/cV0sl14ObGjH/50hDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770805672; c=relaxed/simple;
	bh=LSS8xHXXjdgfnfg+IhB2Un7XBoJ2Glmk2j5+t+KJVsY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hyNIftEwWiSk7DPn1F5ezj3U3uzRoJecjwLhCDtl9A81ugYcMgz943siBBJmJjAM5TqDRL4T6rKUOdghaXPmAztzOQszESIiIB0ayY4lAdGmpBnVbMfwp7O+erXT6ohCaQFO0gEQd8kOIWqJsl6VnXT06RswP7i1Ea2ELg/HQ0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=mxfHft1p; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="mxfHft1p"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b8845cb580bso838841566b.3
        for <phone-devel@vger.kernel.org>; Wed, 11 Feb 2026 02:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1770805670; x=1771410470; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HyC/uhMpICBVlM72cJz0mCT/cxqElCQ77i9jCBuDxhs=;
        b=mxfHft1pnSCMmEnx2rfKkZ40Ou8M47QTSCxyLfIcL4hUMVv2JAF2682GzYJVf9A4Uo
         Nek9ydSK8QND0iK1OFc393Mfqh/m8PLRAXUl2XmG+TjNse0YY3/SwuVkKDBIG6ul00Tv
         zgN1hi+js9a1CZHHlfCQLfOjYSil11MImWjIZA6kaNcsge8A0ELdbSk6/hdf5xMQ0QsA
         Ia2PLyBfGgG4lr5KOigzalP4GSmS+fXE2QAVzRF2J9HaPYfEJrrZErdaheU/IbX76bAZ
         AeYjyfcrbv7flX+LsF95xJxS9gB2RQ5sy5VWRF8Re74coDVwRYbsLYonGHeYXF8JHwoq
         zfrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770805670; x=1771410470;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HyC/uhMpICBVlM72cJz0mCT/cxqElCQ77i9jCBuDxhs=;
        b=d+kNQsY+WkLMmd+qQgXc9BVYLgEYxKpg4jafinnAnvQrOcEa44D3lqpcYoNbN/qqg+
         P1bIvD8bEzYJXyvALFXDDeDKqy3zegIrr7tn1dkryFCFtowAExnVyeh8xNk2REUkhKco
         TYEe2qQE1CRYdZLl1noM3V27LIPJH9+OSGTr+FmZ9e0ml/ihHLPqfvqNRoerOShRTbQ5
         Wx/mBAaNT1c1Lsw8uFKuuNB/2vUOlTg6cw52UGcGlwHGxz/XqKl0CrLHEzOsz+A2hnYT
         TzndfRg6+GDNawpk0n8miRfbAHzZPSYAaOj8U8cm/lGuE+EMurBYyT9bN1WgjxJwj/HG
         zcEA==
X-Forwarded-Encrypted: i=1; AJvYcCWJK5jsdNI1f1skDd3Bn/raz+H+YM7N8CudQ7NlRUut1Yv58aVUO3eLAU/8OmSV3URhfZLdC/If6HYTlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvupd3S2Elk1f7lS9X8ShPcWa8scCac3OidX5TjP44kMr6AbiH
	XPd0ri92Ptzh1f7CdU0c7Gt98YVSBQTYrnzLnvE5c9NaMSr/UKXQ8alBWJsSkhUQ01NHhOL7DLg
	kRZk1
X-Gm-Gg: AZuq6aL3rXQhwcYHCeOMf7dqrgt9qk3ypPup5yy/0fODm/Da1iPiyUOucYPZFtNhCYG
	qI81Sh5MJnfvsbS+md1xjN9+GrowEEVSNV6Bky49sfFNl/QVIA6FjBYcrNB6LRL1it2uv8gAWJT
	yV5bg+Rh/K//z/ZTQdJf5TVPAUFDl+UNgJ+xhkGSJwwU9CrNEy8acavxoS8Bhv4ullTopNn43ez
	sscBlhogHN1UPlh/d4JC7zZp424xHPR/PseuVdGaHv5YdDlsnbCYu2QMC1OK+km3Bybi03NbI3p
	hdEzoF5Srf+F0TcedO8w/e4p76Hgw8rmCooQax97RzwGw/C8COInJ24xsUv/vdEbo/yIFhsvha/
	yUzMuIpvGYf3y8tfc6Dvmdu8CJ+iLiVvyaZcU3h4lqNXp+Vyj3O0nYwUpqSy8YoGd3GgT6mCHl/
	uL94X3GOaH9evf8Eyy9aaBdUN4vjlwP8phr3BxQuTRFRmEXhCYzdDnXcQdlN4im0A5dpurEbNUM
	SqW
X-Received: by 2002:a17:907:3e09:b0:b8e:5e2:79fc with SMTP id a640c23a62f3a-b8f6a99e36cmr109556966b.14.1770805669543;
        Wed, 11 Feb 2026 02:27:49 -0800 (PST)
Received: from [172.16.240.99] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8f6ec54925sm44296266b.53.2026.02.11.02.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 02:27:49 -0800 (PST)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 11 Feb 2026 11:27:34 +0100
Subject: [PATCH 3/3] ASoC: codecs: aw88261: Add firmware-name support
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-aw88261-fwname-v1-3-e24e833a019d@fairphone.com>
References: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
In-Reply-To: <20260211-aw88261-fwname-v1-0-e24e833a019d@fairphone.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Weidong Wang <wangweidong.a@awinic.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Ferrieux <alexandre.ferrieux@orange.com>, 
 Bhushan Shah <bhushan.shah@machinesoul.in>, 
 Bharadwaj Raju <bharadwaj.raju@machinesoul.in>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770805666; l=2022;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=LSS8xHXXjdgfnfg+IhB2Un7XBoJ2Glmk2j5+t+KJVsY=;
 b=DO+9FE4+TyZEMocZyMhfmVlLC5hLI6z/jUitlHfPxB64stboPJ8HugEI1vT1cWUjHvlcbXygw
 et+wFv7LPYXAgfGsKcfhI5Fn+yz3zSOYr8U1/7PEbbh8/ZrtEekiK8t
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Since the aw88261_acf.bin file appears to be device-specific, add
firmware-name support so that devicetree users can point to a
device-specific path to not conflict with other devices that might also
ship a aw88261_acf.bin.

Read the "firmware-name" property if available, and otherwise fall back
to the generic name.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 sound/soc/codecs/aw88261.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/aw88261.c b/sound/soc/codecs/aw88261.c
index 43c03d3cb252..02f8c2bb2569 100644
--- a/sound/soc/codecs/aw88261.c
+++ b/sound/soc/codecs/aw88261.c
@@ -1094,17 +1094,22 @@ static int aw88261_dev_init(struct aw88261 *aw88261, struct aw_container *aw_cfg
 static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 {
 	const struct firmware *cont = NULL;
+	const char *fw_name;
 	int ret;
 
 	aw88261->aw_pa->fw_status = AW88261_DEV_FW_FAILED;
 
-	ret = request_firmware(&cont, AW88261_ACF_FILE, aw88261->aw_pa->dev);
+	ret = device_property_read_string(aw88261->aw_pa->dev, "firmware-name", &fw_name);
+	if (ret)
+		fw_name = AW88261_ACF_FILE;
+
+	ret = request_firmware(&cont, fw_name, aw88261->aw_pa->dev);
 	if (ret)
 		return dev_err_probe(aw88261->aw_pa->dev, ret,
-					"load [%s] failed!", AW88261_ACF_FILE);
+					"load [%s] failed!", fw_name);
 
 	dev_info(aw88261->aw_pa->dev, "loaded %s - size: %zu\n",
-			AW88261_ACF_FILE, cont ? cont->size : 0);
+			fw_name, cont ? cont->size : 0);
 
 	aw88261->aw_cfg = devm_kzalloc(aw88261->aw_pa->dev, cont->size + sizeof(int), GFP_KERNEL);
 	if (!aw88261->aw_cfg) {
@@ -1117,7 +1122,7 @@ static int aw88261_request_firmware_file(struct aw88261 *aw88261)
 
 	ret = aw88395_dev_load_acf_check(aw88261->aw_pa, aw88261->aw_cfg);
 	if (ret) {
-		dev_err(aw88261->aw_pa->dev, "load [%s] failed !", AW88261_ACF_FILE);
+		dev_err(aw88261->aw_pa->dev, "load [%s] failed !", fw_name);
 		return ret;
 	}
 

-- 
2.53.0

