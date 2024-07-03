Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BBA2107
	for <phone-devel@vger.kernel.org>; Wed,  3 Jul 2024 07:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719990069; cv=none; b=hjaWpbxxSWUoPHpqVt8G4d4aNE3fDnm1aJ5wsm3Yhc3o8GY/9ynUPcjV9CBM2e4vaMuLa1vqaA2y+HbOS2cE0mWh2jM0Zy9VYLfdpoOcCD9F5vysvqMH8u3AZyYTGAe/L2HljMkivSj5pzqYqQqj5xSEHyW/M+Vo0zqDMUQIWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719990069; c=relaxed/simple;
	bh=f8D+Z2J34BSelEP0cWYV2FJmD9VvHWhRwMSvzZIllKE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=VVMC/PpwXQ7/ztbeqHoeC9cT+3QvDsorMLJof8Q4hJSAJz/VWIO+T5kRf1b5R34kyDjQtme1oaIca8Ts4e4vXqdrx2Dnz1+l/lwajoeV9lIOx41uUOrlRugEvZTyV0jpO0mDA63+3uObJzzaKo1Xu1AxFoFwJkJt5C7rGKv6Azg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=FLdAN1GZ; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="FLdAN1GZ"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-57d044aa5beso3001944a12.2
        for <phone-devel@vger.kernel.org>; Wed, 03 Jul 2024 00:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1719990065; x=1720594865; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+vwPCi5kZraK7fZ9+mWsGUSaE4NoFQJJBy15JehrMQY=;
        b=FLdAN1GZqccAhEDnoeYQHzuBTcicPagpHC0GiCkoRtdgE9rWl7z5djmOpdjB7QmZAf
         97MWkRlWwD2mydGhdK+/YnlyaFUvteegsxQQ2bLV1kidkUa7jPvbdMlFkYSIEog1j7QL
         AGEHROUV5G4IkswrrHZKMn7EgMHr8SgvJMZrxL/y7ays/u20S0cXk4HhTD2tuf4KjnGs
         SRNDt+AKeJHFKUIJxzLc22deMBToVLSGhMvrP1XUYz116MGYvX6bzktkOHbuVF3Fm0Hs
         cdx+n7LuGk6FuZQnv8mmXtH6/QMNC8wiQjzwFoRUQeSqjx2E+Kc4djsL1Kc4ZkcwOZke
         oSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719990065; x=1720594865;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+vwPCi5kZraK7fZ9+mWsGUSaE4NoFQJJBy15JehrMQY=;
        b=JaAbOiRdpK83YPMt+QewPnolnWj+BLvXvB1GTBMhb5jf1uT1dFP3zgqHfCVcz3ii+s
         Ravna0qJbFTNPU94pYi176a9lN3nNcmv+FfSorT+cpZcPSSN6SVgXOVudnOYrRZD80xo
         vdqsqd73H9G5QBC+uzCzBvaIaBqnTyptO28EcSJIsVLuAtR7Z0fcS8teLZaaLVZeyAhm
         u/Su2fNtkuQSyyAtWfzIeumQLM1AnkAgB13vycrOuXmi7oEbyrwMdhgREehaoVnh9OaV
         AIJBwu8aXE+VsPL201FkJ+2hvUSm71hMMCp03xuwAs75a2eRVmsuWIhDkuiMskY+LW7R
         Il8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWcQ7hFUymMD3OrmWJ/tMtixNUKPgjpHVjZG3hKxrXvlFWKX5nncl4FldlHyJSaMynB/mrSgH0eaMJIvBlLOyuDQlVccvE678CYyiM=
X-Gm-Message-State: AOJu0Yw8PaxK8NCHVP+KgJN/dTcccieP8xRFDZCBQE/mQLegDV7UZd3n
	zwLuUKJs1qGEz5R2qm/C4ICmMQs9dqqmD/vA/n1sYz4oD7sMZA06OWmsAyaDJsQnO+ESl8SWwg1
	A
X-Google-Smtp-Source: AGHT+IF+hNjOQ8pgB+LTiDmZIsDCqWlOmR/DaW18R//nPEntEnY4XXHH2GvdOuB2r4getznFqqVE+A==
X-Received: by 2002:a05:6402:13c5:b0:57c:c171:2fb4 with SMTP id 4fb4d7f45d1cf-587a0635d6cmr7965226a12.30.1719990064937;
        Wed, 03 Jul 2024 00:01:04 -0700 (PDT)
Received: from [100.64.0.4] (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-58612c8371dsm6632834a12.9.2024.07.03.00.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 00:01:04 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 03 Jul 2024 09:01:03 +0200
Subject: [PATCH] soc: qcom: socinfo: Add PM6350 PMIC
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240703-socinfo-pm6350-v1-1-e12369af3ed6@fairphone.com>
X-B4-Tracking: v=1; b=H4sIAC73hGYC/x3MQQqAIBBA0avErBMmLYWuEi1qHGsWaShEEN09a
 fkW/z9QOAsXGJsHMl9SJMWKrm2A9iVurMRXg0bdo0OjSiKJIanzsGZARdpR8KhptRZqdGYOcv/
 DaX7fD16LoKBgAAAA
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.0

Add the ID for the PM6350 PMIC found on e.g. SM7225 Fairphone 4.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/soc/qcom/socinfo.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index beb23e292323..d7359a235e3c 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -116,6 +116,7 @@ static const char *const pmic_models[] = {
 	[50] = "PM8350B",
 	[51] = "PMR735A",
 	[52] = "PMR735B",
+	[54] = "PM6350",
 	[55] = "PM4125",
 	[58] = "PM8450",
 	[65] = "PM8010",

---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240703-socinfo-pm6350-c27cfd02cb66

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

