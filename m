Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5D438F258;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939176; cv=none; b=J1pQqmUa0dl2A5H8bSDuQobdQ6lSsBb/K1MgrO+oq/LfcDZT6GqsOgvTY6NzN1mQzLnf1fbsdntoTYoZWAwBO2mDw+EnKFaOO5OPR91dLv3Wgt9bXks+/89k32ItxILbw2Fs+ym+9AinSsGhQPDWTMs2kPbFju7oigfs92xw3LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939176; c=relaxed/simple;
	bh=9BTqj89bZxMO325WD7xX7lCh2duf1b3+w/twlN+ydgw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oBdPELogoamuVJAhn3Fo7DakV2aTnGC0Kz0H8BxnSk6dXWSjxYT8QSlL08R/Cw1lff2inLG6Vn2RORsnS+QoDbqo84XJjPCreScoX45VQ60k75c2uPArU7KdqHf9hHCN5xQna/i8qoNgRjSAWEoLPX5WkUSazMO0L92UKaBnYfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9/ps9WM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9/ps9WM"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2AE55C2BCC6;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782939176;
	bh=9BTqj89bZxMO325WD7xX7lCh2duf1b3+w/twlN+ydgw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=X9/ps9WMXdLiUn6n5QWIzWvPWTQgYYA6dw6dQ/pvZ9qYRdDsm/HOApzoLK8qaniyb
	 jWaSZ4g9LgojvVxboylQPihgi5Q7Hqd9N3yIRqEZ1omGC1oOP9Zlauh9949srZlLau
	 p2fFqhFw/4dFbmhPMG2HNZJjdZR/sNhd+ytFZCFWTcwkftBWZOUuVz0HsEZ3bC4QYn
	 TSCz3cqZMOQh1AUR3ne8nkuw8jdBnd9BR4OQ4sCkhMIvBLgwQ4XuD9ydlTgiMtcFbv
	 FjCD/VcHtRu29xFfvkcs2XdiC9RWTSjo1aCJfW/CIFk97OeddaHOo+Kc5aeA6qOpt9
	 EZqH5/e/jUwVw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1206CC44500;
	Wed,  1 Jul 2026 20:52:56 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Wed, 01 Jul 2026 23:55:55 +0200
Subject: [PATCH v6 2/4] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 WiFi/Bluetooth
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-rimob-new-features-v6-2-be7d5d1e007f@protonmail.com>
References: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com>
In-Reply-To: <20260701-rimob-new-features-v6-0-be7d5d1e007f@protonmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782942968; l=1054;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=fh/EPBf6DDi6xO2cT/WF/4Df/j3opWByAPpvZnndrW8=;
 b=R4zM1P/Hr6IXKz9AHkz0y0Eo0nHecrIsFCkGZ7dFzrxzBXjCWZfUDPPNcCvZd7kHX+IosP25n
 NfcMNMONfOqB20U02MdXYZgffCcvoSEiWAJTV/c8QV95wuojpdQMjom
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Configure and enable the WCNSS which provides WiFi and Bluetooth on this
device using the WCN3660B chip.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
index 5a9d71d1e466..db5c9f04bf1a 100644
--- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -326,3 +326,18 @@ &usb3 {
 &usb3_dwc3 {
 	dr_mode = "peripheral";
 };
+
+&wcnss {
+	vddpx-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3660b";
+
+	vddxo-supply = <&pm8953_l7>;
+	vddrfa-supply = <&pm8953_l19>;
+	vddpa-supply = <&pm8953_l9>;
+	vdddig-supply = <&pm8953_l5>;
+};

-- 
2.53.0


