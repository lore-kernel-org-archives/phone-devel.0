Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634062D46DC
	for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 07:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752564597; cv=none; b=kMRvt4x0gkeo/wc4VQBAsjrPOUVUMJH1e43l5Yse3GEb//ANvsoChYegz6SiQx22BQnF83PC3vLtnq8TKgK8fpf6TaMqHly1EEGUDUJ91H9BU/rf55nsFkJ+45pkx9CtMDXmC61CXBaVrrsB1epTKkjSOT1WgP7HqUb9h3LNW5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752564597; c=relaxed/simple;
	bh=dKRIX2zCBDl46th6tpWYKQ8ftUYUz3Ovibvr6genGas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EshUq/as/mfkqN0cLm9Ykwh/qK39g+PXWq+QkEyZ1LFQBzl9aE9OkKlEQRjA5TNnKQNREPl6W29cUr8RVECACwAQBUufntLe6oTqy7kD+igdYfzQNM0pNdjUwSpEzIFcMAZd4tDVnrpynApdDF7dQCG6WqHfDtWwcT+PIKc0S/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=wsRWK4/h; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="wsRWK4/h"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4537edf2c3cso53083495e9.3
        for <phone-devel@vger.kernel.org>; Tue, 15 Jul 2025 00:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1752564594; x=1753169394; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cKX26aKnBjtUzQOYUax+zZK1e97PUjbyxNSQ0DpaCR0=;
        b=wsRWK4/h1zUsrJY9ho6+o2s0Fvg3gpAO2qmwJMLSCzcnFUVF6r0hOFsFoc7YkApRz8
         mln6LeDJXhX/tSE6oY7EiyYEBvg28+Kta32lCatnNGCcIgvTrlMYeu09UggzPC9Bs0Xm
         DmTqvJX+4XOjUpM2YABYqwnbY6r0yvVgHmpNok1+8/C7E9ExXjhlUG+FQ8lM9UuWh3X4
         9qz1QzWvDVcqlRuqD7Rz+FwFVVt66vnUenDevfU/ezR+N2M2w1zHwv4n9a9YBLjV9xNF
         Ha8K0qCD80pO3xC3xQXucrwYQMHu9pdN+W7JKj9IVtLKkFRVppAgiv6mTp9owvyColh8
         Enug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752564594; x=1753169394;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cKX26aKnBjtUzQOYUax+zZK1e97PUjbyxNSQ0DpaCR0=;
        b=wZYDPUMmfR5+gDZ00CL6uyXjshXqseQeRyvSGcpfTH0QOgHXa6YkArOoiTr22iZmoI
         m2yk/0clNsYa4vTM0fYGtwgwzZbZugUV6DX8UNW5TNXMG/vWcMySLdhsQiL1F0Qpppfw
         9vS8IY88UrTuKT4Tg2Cyu5TvF0+6O24Xljm8XwfIEGGCAbfvCkQXd8CA5inXar14UALW
         L9DyCbj7sYyQOQAEYPP5p3bliClD+GWXqQUYbpGXyZZkbY5oTgyYfZAmmfOXmxn4vbYT
         EVgRrEefb0khyjkkIa/2eDXryVqjTm40KA116tzf42MtOk3F/W7BvP6lxcWyyVCAc4q8
         pACg==
X-Forwarded-Encrypted: i=1; AJvYcCUfPZwMweW1b87LQHxltHDJ1ccLtUz6pEGaUlJCJrc0XzMZAV9/F1tiWHUDTaGjyZX4jwRUb2KyGWYTDQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzYCu1dUsuiF5vBuemLMlhRvoSex2VZowdYbH9XfmLhPNoI3gaW
	FrCtFGik5mBU3+bh7E80EPQ8HN8v7JZ8iXGKRHDcn17oXoX4iVNiKyvKY/9SvS5KMms=
X-Gm-Gg: ASbGncuoRrit1tPQnPXNRvbheNHWfhgCyCZsq7LMaaSidwO3KJM0OPNN2HFjgIR/Pt0
	cNuiXEhlhTS4Bo07Sp9ZSsePAH8ylHwF3m/oMigx3ZOCTFNaQ5nH7hmXkTro4RaXu6IF8bm7909
	Tc7tgwumYEWzi6d9tK2XzGDzMqtdCiZwgdtvq3mOHgHGPV63seoMZomYjEfeBlJ86+Dr9GHGD8P
	mXuu7SQsOKLFuAnS8IrDwE8hv8emaqhxZc0KO2fzitJXmY+9AAqN9dkGpDcsiduDoSjM/txw5C1
	hnBReI/7MJ2I0Inq61r+xaECBTxvk6nxErtV41qevxluQOcLcYKgIpjO0JaxkMsQT7pgEccIbbT
	LuZ/3A5y8r7r+lG14Dvy4e/d4PdQiGupci4LPScwXzYEQx+GzcoQJVII1phP1LJ0RV1g=
X-Google-Smtp-Source: AGHT+IH/721YD0d2nZC/ZtDRok89aWdqeORozs5yHiHN61ozNTDLlak1hxt58SbOisTPzHt9mdONKg==
X-Received: by 2002:a05:600c:1f11:b0:454:ccd6:327 with SMTP id 5b1f17b1804b1-456272d233fmr13038635e9.1.1752564593644;
        Tue, 15 Jul 2025 00:29:53 -0700 (PDT)
Received: from otso.local (212095005088.public.telering.at. [212.95.5.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-455f8fc5a01sm106703395e9.32.2025.07.15.00.29.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jul 2025 00:29:53 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 15 Jul 2025 09:29:37 +0200
Subject: [PATCH v3 4/4] phy: qcom: phy-qcom-snps-eusb2: Update init
 sequence per HPG 1.0.2
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250715-sm7635-eusb-phy-v3-4-6c3224085eb6@fairphone.com>
References: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
In-Reply-To: <20250715-sm7635-eusb-phy-v3-0-6c3224085eb6@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752564584; l=1041;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=dKRIX2zCBDl46th6tpWYKQ8ftUYUz3Ovibvr6genGas=;
 b=jg+3EAQfrVGVvex10SEG9/YqZt9ntRuWJlCNcEabPPuV1ZNP043tJEYI08EeUFSbw7GXST/WE
 y1W/CWHqrcmCs+Q8gklChp3SDKzDopYBRGsktodY6QduCnNEF9NHpeO
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The eUSB2 HPG version 1.0.2 asks to clear bits [7:1] on all targets.
Implement that change in the driver to follow.

See also https://lore.kernel.org/linux-arm-msm/7d073433-f254-4d75-a68b-d184f900294a@oss.qualcomm.com/

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 drivers/phy/phy-snps-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index e232b8b4d29100b8fee9e913e2124788af09f2aa..90b3da79900467dccbbec226db1cc83297ce8834 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -392,7 +392,7 @@ static int qcom_snps_eusb2_hsphy_init(struct phy *p)
 
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_1,
 				    PHY_CFG_PLL_CPBIAS_CNTRL_MASK,
-				    FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x1));
+				    FIELD_PREP(PHY_CFG_PLL_CPBIAS_CNTRL_MASK, 0x0));
 
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_4,
 				    PHY_CFG_PLL_INT_CNTRL_MASK,

-- 
2.50.1

