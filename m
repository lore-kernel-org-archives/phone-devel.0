Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4D73D5237
	for <phone-devel@vger.kernel.org>; Sat, 18 Jul 2026 15:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784388097; cv=none; b=t4SBOR238h0Rkw1fJCUgSZY0pGADinv22J6bhas+EPD4H4UcmYf5dOk2UGixpSRzdi6pjely+2ngsSqZnI67k6r6yQN3AmvP9kgBDfvVodHtATHFOsuPIqy6LJORP14cX9C1xrCFWqQRQUyTJd4WNMMblSfTHKZT36KTliZPB0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784388097; c=relaxed/simple;
	bh=pDPn99N+ICG1K7TKp4PgKMOzXmJllsI8p04WRkYOgbQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=JhFKICvmqfY8CmQtSkCsDenNAM8xqJDN4DUaAoS1pR2XLHnDIXSGHzLLCI+nDvJszFRNqS9SeA7J5RJ7Tq+mX3xE3O14fKHVetob8kEU3YCum/mA6BF6hlV7euNXtT11ZPmKh9L8YgS7EjuEshtdDhUKC9DmVXb0J/oVDqcfaTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r0PTt4WX; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r0PTt4WX"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38dc4553f62so7140891a91.0
        for <phone-devel@vger.kernel.org>; Sat, 18 Jul 2026 08:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784388095; x=1784992895; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yEoG8yRI+aYCT3H+YBQOUKD8pSL6ReWVyutnSqA0MV0=;
        b=r0PTt4WXtJ3v2C/rv9/7EShJe/7MQFeGy3Ybudc5nJvVH3QKTchPNorZSG60Gz/wZA
         /f3gN+/t7alJc5svO5W/dfZXltyVbW+t4t45BHa9UozbX4PEaWnOo3vk/tofYKkaSEP6
         UCN/GMGprNpUcZXTuvvgvpEyxkpnxjlwhGER4rcXgAIrK/8h20o67SaugyoTVAPIrsXR
         Z6/w2RqJxVj4hUi5BQ5R5ngZG//n+c2UKw79jLLuIIJIM//wd1CxlmaJZOqkMVoMkkrp
         fwL3I52jdjVv4Z5CtLWDpESku2xTHPE2Z1hv1iaN6+/XcwrjIlEmGjT9zPdnkEHtqVnU
         xMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784388095; x=1784992895;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yEoG8yRI+aYCT3H+YBQOUKD8pSL6ReWVyutnSqA0MV0=;
        b=VQxPgRFnxOCFTuROEKMoNuI5FS4fyu0NAY4TxuLT2ZzJjGLtz4HFvPLkgkaC1V736a
         rRTe9UOmql6nopFhy5E5yYebT3TBCOCLJw1C4oDgYmQGbQIUZK3RCv6otYzxMu7t5BZq
         6n+2pPOphfOecPBY4vLTJeeWmRTbh+TiqnwkJZQB5EalS+27wngKUo+smcbZeHGvGEGs
         JpARWJfHPBMO6sfoiro27MQRBak7CY87NBglCw/Z4sHU37a4c7LDQwcZeWg3JFlw5AId
         KvsuB17ZWzCkYHEZnTVsrVUPZBDAWf4N7is+p075e6deCK+sBxHL0gyPguXVFIYDYniH
         Tdbg==
X-Forwarded-Encrypted: i=1; AHgh+RqP0iIm0MwOhszNVeUcX7TSqDL06vnyNIbQkWnfgqe1ayDoZSpAJ7AfQVOtKIvBQxOpR1lTKA4SjT06ag==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHb0eF3kFhhYC5Mova7+xDdmStlR398vCSIcx2F1odRnnBOUSo
	D0YYa1X5Q/LdagSiVHgUHU8TI9wDuNpVkctI3m3COI0+LkWpX+HeMoHp
X-Gm-Gg: AfdE7ckiaP+20eqCnQVjN8jRcilybQHEIAv6R9zdTzazohO/ni1xlegVzmEIkxaSi9r
	il64s55QEpIoz3pj5Dqr7axgJLw5duKR8Y16sGo2VmEcSpey29HLKZTRTvukUT1ONdp/uWgD6hw
	H0l4XXQ1Hl0pHyqNdZ1ubMUafa+y8KCni448Aa1UpE1FzQjGblYSnY7D6fW44heb8m7jxhjVcFc
	RPZ7kZ8+Qiwjx4UeJhO+CPsMdxO7PqY96wfWwq5ayC6OcFT4OGGrg2GEwXRLgUSxGaiapjgHbmD
	KXgcdXlTbpeuZSrnpVsq+s/0VX5fnXhSibVx4dudYZux+zdh5g0hQuxS34U5omXOtrNJYXj593q
	VrKCqyStmLzR2dRusyQOu5q/uNmVGOXTeoc9PBWFpUNm1EsZvcCXYYqsiT5Ezan/7JKAHd+ir3v
	cdn8kezqk4
X-Received: by 2002:a17:90b:1f8d:b0:38d:c0f9:30be with SMTP id 98e67ed59e1d1-38e4b578797mr7711017a91.38.1784388094777;
        Sat, 18 Jul 2026 08:21:34 -0700 (PDT)
Received: from [192.168.0.103] ([45.113.100.172])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-31429f9bcccsm21303405eec.4.2026.07.18.08.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 08:21:34 -0700 (PDT)
From: Biswapriyo Nath <nathbappai@gmail.com>
Date: Sat, 18 Jul 2026 15:21:25 +0000
Subject: [PATCH] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add vbus-supply in
 Type-C connector
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-ginkgo-vbus-typec-v1-1-d5ed0aa6b78b@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2Nyw6CMBBFf4V07RDLu8QY/8OwKO2IVctrCtEQ/
 t0KbiY5yZ1zFkY4GiRWBgsbcTZkutYDPwRM3WXbIBjtmUXHKDvmvIDGtM+mg7meCNynRwVS5Fr
 EhdAy1sz/9SPezHtzXqudaaofqNxP9F+MOEw+5vYZs0gkt1gZnLZWygV4DTjV2702c8iAJ3maZ
 CKNikhfOqJwmORLddaG/pxZta5fYhs829MAAAA=
X-Change-ID: 20260718-ginkgo-vbus-typec-a97d9389da3d
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Biswapriyo Nath <nathbappai@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784388090; l=1616;
 i=nathbappai@gmail.com; s=20260718; h=from:subject:message-id;
 bh=pDPn99N+ICG1K7TKp4PgKMOzXmJllsI8p04WRkYOgbQ=;
 b=7KDba2OaRdEYGWz/amL5v2WMGbUjUZyEWGEv+7QG7GQ5sPQLIaaMv/Wc6kT0U0i4LK470diaV
 WR9/mCnqATqCZqIstaZea6CsLysP2O7o4Ckvq4SAaMlNZNQjl97OBpZ
X-Developer-Key: i=nathbappai@gmail.com; a=ed25519;
 pk=ATtK28d7wNTkFPtwgWLEaJ1T7ikcnGabljPw7CKsQ0Q=

VBUS supply property was moved from pmi632 typec node to USB-C connector.
This fixes the following warning in kernel message.
pmic@2:typec@1500: supply vdd-vbus not found, using dummy regulator

Fixes: c1da9374c3e0 ("arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property")
Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
---
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
index a5458ab41629..59042a593753 100644
--- a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi
@@ -133,6 +133,8 @@ connector {
 		typec-power-opmode = "default";
 		pd-disable;
 
+		vbus-supply = <&pmi632_vbus>;
+
 		port {
 			pmi632_hs_in: endpoint {
 				remote-endpoint = <&usb_dwc3_hs>;

---
base-commit: 0718283ab28bc3907e10b61a6b4be6fefa1cbb2f
change-id: 20260718-ginkgo-vbus-typec-a97d9389da3d
prerequisite-message-id: <20260519-fix-tcpm-vbus-v1-6-14754695282d@oss.qualcomm.com>
prerequisite-patch-id: 6c6c95591d4aff3681de3a3bbeae9d23f77040c5
prerequisite-patch-id: 51a84aabba9117f91505cc9c17f2c7064768ca33
prerequisite-patch-id: 2432fbca7762ddb799b5c64f932760083ff0ea85
prerequisite-patch-id: e3fe6166b11e43616b406a1ff6a8ac28611e7cdf
prerequisite-patch-id: fe4070481a2bfc530e1a869bd981c32a8147f7e9
prerequisite-patch-id: 4fc9afebebdfadfe644126dcdcdfe30f8e0ae685

Best regards,
--  
Biswapriyo Nath <nathbappai@gmail.com>

