Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795440506;
	b=RlwC3Mc5dwZFySI3HdWdJOBuf/2IbhW6lw8PuvLHzH588YgLL/tiQVQY/Pcb+MnUFjXZ
	 sTaAXoSSkRyvFQLMtNZ6v5Xmn7IXIxqPDTM3YS5W+x4T8Z4K3JRI2RBXNYOvoX2zjYmk9
	 V1PpPhR6i4ILOO7WOvTucTSv2dvFXuTs+fyn2ZfSK55h1e0njFrRJy1cbusrH34AqOvlI
	 4jJHgWse2KEUYYnm42ZIZtxeJw2SeFpBgWRvI6iQtCq8fejvzB7NoAxAQOTNvRE4kOXyK
	 7R+uG8sIaL1we/rMUXbqRooBevie6AdIRUY6j9mAnvGbS4CRlHOkxK1q18bN4wgjw7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795440506;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yGbRGpc0KyQ1sa8hSvTupva6fTceQGCvb2e5cOoPHDY=;
	b=lGfhrr6w9AOOiNcL/BSgdMoQil5DJfVfZ1hUUzgGGs2r5vO2r07F6Q2JFXWfO+YjqHvW
	 scpXWH4DCvDSLmPOKjMRqaoNFgga+63BsZKIOVzuSYxnBlH8+31gTo9v8xqqjPzJOTNuI
	 EgsfWSOvs4X+pJERpSPTrLykfMu49xpikGGxnODtUI513ywGkta9qK7D3Bqzb3HK25mqM
	 lqXjiZErK4ml+sQyHADy3pq/vUmBO5Z9D1vuYuFY2zIcphnaIljJ6SOBuZP1ogSdNWI/W
	 J/xZSc6b3NuCgmj1GTaWsdcf9d3/cxG6VMCyfBtoBKV3N69kO8yGDQxKe/41lClb3Ww==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnLXCMiD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD5B606A334;
	Mon, 23 Nov 2026 13:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DnLXCMiD
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795440505;
	b=JgDpGs1rH5JVG8NMsx6OXe/LCCjvsjIWCd1/Eqw8sATNmAvNscQyvC98KOn5yR6o5cvh
	 vdQPm0/NxwtA17vx9gN4CXmIoUecxOrzDgB/tJt8MR03NLWrRXZ0HFpiie/W6gU9vKMT8
	 iu2K0kipIpebqE3rbdOvTfRjawqWymoiY1l0GL4+baM8z7YAEYtXIozgXOkJ+rvd+ZC1h
	 G9VsAAvI3a1Fcx5nMbJsN9HDF6OhY2sSrwknCYhIkQRm3XMmrMkPbkrAMOYTXLFN0fbXo
	 C9g6AbS3dzQpU4lWmQ+zI7KQroBY/wdU44EygAxt8Auun6xkNVPE1Ft+SEgbBvjMKQQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795440505;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=yGbRGpc0KyQ1sa8hSvTupva6fTceQGCvb2e5cOoPHDY=;
	b=BejvZdpi5gOokbNsncqkZU0B/7NN38WTxggL5v1hZSogTAwYzq/Ft+qP4GnYU3G+GbwX
	 Xwv77Fc9Pj//LHCAT0HgtqrX6DCVAs30hFglAGAh4vptA2bFymuJ+j0rOATnsfOJQIUMo
	 7I/R42+hkWy9s346Sng+g+REqb+S3Mh63UhrgV/FgLWvhotgJ9a0im1drpxwPD6oZKKF3
	 7uqMDkaUX/U0mFqaaS/SZZXvfM8wiqHPFJBAPhad+R+HOMEox0WyRg7M9pPlYJ32OG6aS
	 mqrynU7zsuKC3/pz2FZLwQQGzbrSp2ywMjMqB+4yOOD65TkW3bBb2EifVWzZcTLOQHg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 80AD81F000E0;
	Mon, 23 Nov 2026 13:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795440505;
	bh=yGbRGpc0KyQ1sa8hSvTupva6fTceQGCvb2e5cOoPHDY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=DnLXCMiDgV7i0G4AzCTOtaQ3v58hJhT04L1apZRrAskOrhw9ufxgXKdec6rRW+mv7
	 tOt4jsXBKA1hrZjx4xbSlxiDum6szUkBk8LypqH4q/SlsxvPet5axIZHdnaiMOggyK
	 uTTzyfb7Hd1/YjzFuKuG6Cyziwiz9FSlHmKLn69Qi9ukgb0FTOKtuBLS7dgv8C5aQs
	 dqf29wVf3GYqHp+5Rue3FqqPLBNUiqdESkOpnD7aAWjZxytkrfgrkB3TbSq4M0irFj
	 HV9U9zxK+trQfUEHhUoNH4l6Gjd9XObP5xw7C09q/x9BQ/xlU9kW/6UvZ/gVoOrtqb
	 8QcL1gSO7DqkQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 09DEC4C49D;
	Mon, 23 Nov 2026 13:28:13 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 23 Nov 2026 14:28:11 +0100
Subject: [PATCH v11 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Post: <mailto:phone-devel@vger.kernel.org>
List-Help: <mailto:phone-devel+help@vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
List-Owner: <mailto:phone-devel+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-pixel3-camera-v11-2-d00195d180dc@ixit.cz>
References: <20261123-pixel3-camera-v11-0-d00195d180dc@ixit.cz>
In-Reply-To: <20261123-pixel3-camera-v11-0-d00195d180dc@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2281; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=F5sq/PnEtjGmqazwQ+898n43o6XCMRwhDRliedBHnYI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBrBD9sIxiiUQti76uzxmxCbXSPPNPXP+MIf3Pl7
 jsrnnTPRkyJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCawQ/bAAKCRBgAj/E00kg
 cuUND/95Laajx/9lats4rCo4YRkRAu1tJ281PJ7xa3EJeqvwmLWZAcJGLskOKOUO/2VUGTQHTab
 CFExrRuJG9dezrM8k7AFf+EmVjmFqrvv+mnsqefj6hTbwGmQSTlz7wUqZvpRStWTVMwDUIrML/6
 bPET9mQiPY1D2Sd41zyQdV5dRUslqRGVsIlErou/HUiiKF18sEJ7uISWqGtS4lr/n6sl7HcODr/
 69iu6h2hQmA8JY8XxiXh29LzA0/F/HxRAmMwiGawum3uW55XVyfoNI1og/wDPTxLzpYr36XMdcP
 Shsg/mqBiPI1LmlaWJx6s9tq/Ass0dwBtLMB0Zw0ZR6Bo5x70QtKCVVYh1VeiPWkZqyGCA2N9ib
 V3lW2gSKnu794A7uusdvtt8AupPwbzxsAXm7TnAeMDGg4NUyrc+2jYS9zx/Jdku5kqDc9Ofp/+d
 aKhJsunLM261MO4qH17Xv4d/6fzFTEd5csr85rbgBXJKQHx4e54QkGaicqv/h30QT+cGtkxTy+V
 SSyXNDMMHZBHeaSILWNPPaVgJiwnWcIXIBRQ7jlCQIqGS3vrNgLkLOr27kQSxMqxrKS3q6JQr8l
 bdhoSniG/JTrR4Iu/ZMiqQofqaHg/S4zil8w6dUmriXLXfmZYsF6qYJRzlI3PMEmSht9TPAyZgi
 IP/0OyaL0iKMEQA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz
Content-Transfer-Encoding: 7bit

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 flash LED block and describe two white flash LEDs
used for the rear camera.

Configure the LED in flash mode with hardware limits matching the
original device configuration, including maximum current and timeout.

In contrary to downstream, we can control both LEDs separately.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 27 ++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 1c1cc036dcfe8..4084b6215f8be 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -1,16 +1,17 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
 /dts-v1/;
 
 #include <dt-bindings/arm/qcom,ids.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interface-devices.h>
 #include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
@@ -593,16 +594,42 @@ &pm8998_resin {
 };
 
 &pmi8998_charger {
 	monitored-battery = <&battery>;
 
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	/* upper part of the flash module */
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <0>;
+	};
+
+	/* lower part of the flash module */
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+		function-enumerator = <1>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
 &qupv3_id_1 {
 	status = "okay";
 };
 

-- 
2.55.0


