Received: from mail-ej2-f14.google.com (mail-ej2-f14.google.com [74.125.228.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589264D2ECF
	for <phone-devel@vger.kernel.org>; Fri,  2 Oct 2026 14:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790950918; cv=none; b=QRpyWjxAWZHr1dB7APq25IJfAEABg9Ya/Ur1QjtOdQXL+jJEehKz+qM7jhsebSqUorE6bS1U5I5mTZXaVLH+vlA2qvLxKTPOgxkqssH+ifWNZKuFjncWzNWaxXepxtACTrHkNCx5DLtSapgZLFRW1U99QK0u5ugzhw2A04HE0gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790950918; c=relaxed/simple;
	bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEX/GzJX8dX1mvFlMQD6lT0mz5Qvw5rs9uM0bQydGcP2MeAsTxwCYEXjQieSNIobeWcRdA7mU9zafVAjkZqV3+alf5tioo85c1ork7MqBk25wN/tTg0FGuytyIFcOC1z3c/N7exWh3s609HCeGAui8lzEUBDkivdFWXVqjrEHQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=tEBMOciz; arc=none smtp.client-ip=74.125.228.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="tEBMOciz"
Received: by mail-ej2-f14.google.com with SMTP id a640c23a62f3a-c2e3507d4a9so308620466b.0
        for <phone-devel@vger.kernel.org>; Fri, 02 Oct 2026 07:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1790950913; x=1791555713; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=tEBMOcizra5L0qmDTNm3J00uOZoDNWOvCWn+XMMtyAyl2yJSWfcIiNNBHTvkJBgpjq
         RN3GbnojkXRQHKGlGDaeknuWHeisoKhJI7A/GcDivEvqUrdjGf4i2ilqttDShFTcLiym
         u7j4ph4SjYPt07tdEc2DwkOGw/OPp0KDm4nXUSQpbXWsqjB3jdwWsrZ+sPgFfq8caKuI
         mk+BjJaGEAcfQ6zCY2/EiR1WZJ1sgbGbKPdjB+FHQxY17hR6/J7mju+JoLNdX5Kk1vo7
         k3nl/JbRAqpuqh4VlJFlW7XCh4gwofOu4nLdGkPzZ06dLpTlAvlzOXFvLRzHq1AH5crR
         Fi3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790950913; x=1791555713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=trob71jrLJmnCTpqAQkVdV8k9io4Vh7M+IWZZGLBcWY=;
        b=ujxjSlPc183pMt+jveR0I5LJAbjixYUtA8oAhRqVonbmcNpIaUNdcHS+22wFrDtmTi
         QFO+vANt/HHNIiIeVnDD+5PCtK71VEEB2xLcaowus/cFTHsdnyyJylviYT8/KVF9rgMP
         57R3GkTr1eo7dAVWUmj+YpxqHUS4sS2ArVt/HB/fkZjlVvkK8g74FHheFf9M8G9VpKjZ
         pYLDswIgzrVMuno0MslormZjUSwvl1iT9doVKyV6soJznBqMaVqXYxJUiVX4yXr0oXfX
         3Z2ic9w/Xz0Gfhn0qGSaxX53w1fiAhdWgZh5hF6gxXmh3joPwsb+Ex3Q6a9JFYLXmZwf
         QOUQ==
X-Forwarded-Encrypted: i=1; AKwUvBx0X21rxVQB8Qwom5PCN73jmBx2dRkEuxptTpi2aXMyKdBtHoSiYOj0dlUeETRC8XCh4TAlfrr9wBJ88A==@vger.kernel.org
X-Gm-Message-State: AFuF++koo5X5GH3cfYhzB3eooQkE4DQhbI0L787hXMZvl8KAHFe6MtMt
	tPdhOYe2oGIhhHoqhQndpmn8oQ8/Oifqo0MSzhxO/bCkUoa60cKMcjHievK0pd5WAbk=
X-Gm-Gg: AYBFou29mHi7pxK1zW2imMDPBAGE2OfLYsW4eKz/OeJo1CzBc57FiwbioKL+rUaAS/2
	loQy2BoJ0vjbMzD42Q/KPWyFYhE3+kexrQBFfporQxoMH5yYKrMpHAXTw+jcsL7um5kucNscc0H
	weEztp81bXL1HwyjWePj9DWUZl6kxyod4uXpf7thbwsDhpknjfLRKnmmumLxvEFkMK6vK5iyvum
	rq/TN5uXfIpgKy000iNSGMRRhF4Y/LH0CvYogHO4rGMpXEu/hphj8yqW2EcxpLmoNv4fmTspDOv
	q+jBr+Q5wA5G9u+LDmzgHIKVuptNkGPZTdMnTnN9al0NGR33Fsc1pWnS+zxEeFo9Hwu4LjTuZIH
	42HjVeo3LbgWKEbXLNCX/OjD1a5H+eIH8RmEJv+F+/z1n1ZwhW8Zoe/iy75+ah+XG24WOg5SdFo
	ASMi3Lj2QlnKV4Gy3l+jvkfbE/xL6IMJbK2VRcMcmdiz2+7FeoLCxMtVDsDcK8NJ8ECBiXDyL/F
	riPSPxapNamqNF9opS/wtDKRPDz0A3qFbjNQ5ge8xNMSFK/Uqmi
X-Received: by 2002:a17:907:c486:b0:c29:462b:f908 with SMTP id a640c23a62f3a-c2e4afa70cemr214706366b.10.1790950913549;
        Fri, 02 Oct 2026 07:21:53 -0700 (PDT)
Received: from [172.16.240.104] (144-178-202-142.static.ef-service.nl. [144.178.202.142])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf684e3sm89307166b.51.2026.10.02.07.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:21:52 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 02 Oct 2026 16:21:47 +0200
Subject: [PATCH v3 3/4] arm64: defconfig: Enable Novatek NT37705 panel
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-fp6-panel-v3-3-4b80f83bc936@fairphone.com>
References: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
In-Reply-To: <20261002-fp6-panel-v3-0-4b80f83bc936@fairphone.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790950908; l=791;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=Ow1g5nb84JaBXwtId7U1Ei7JzeZxrlP38LbY2puBam8=;
 b=vnNsKzfbkcaR8E0y2/h+wIatu+JyKUI5twpCAlB8F/NPQKE/TnVb4EiB5ijJkaLsyDesPU73e
 g1IiPWSVy6KDdSr2cBXQC2rSEdzpAJQHV+IejXByTjAlp4igx2Zxo2g
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Enable the NT37705 panel driver which is used on Fairphone (Gen. 6).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 6ec8d3a69c98..1d4afc733c8a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1023,6 +1023,7 @@ CONFIG_DRM_PANEL_KHADAS_TS050=m
 CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672A=m
 CONFIG_DRM_PANEL_NOVATEK_NT36672E=m
+CONFIG_DRM_PANEL_NOVATEK_NT37705=m
 CONFIG_DRM_PANEL_NOVATEK_NT37801=m
 CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
 CONFIG_DRM_PANEL_RAYDIUM_RM692E5=m

-- 
2.56.0

