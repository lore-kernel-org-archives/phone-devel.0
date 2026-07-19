Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2597404E;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784480524; cv=none; b=YoVHJX2NEUbZ68S2ltMrtEo0lX5DAz63JfQewL1F+COpuQhqi8GI2sHK6rEHYvzaKoPQ6BWf+L8KkLa5uUcxHKC4/dsO7Uh6s92G8g11pEgDfPhcK1CIbCOfwutw2TuEzaldWcVVUY7rPV33FFSOKzA6LSw/eJotGmjxRjAjiSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784480524; c=relaxed/simple;
	bh=5yVsH49bLm+KRqlWEbyRI1pgavGG7dUqYNk7iEKRH5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugZ//qEBZ/hujVNDIQ/7JgidOfXApFXNpbHVdSXoMJdNofJAbZfBjEDa0CVeSBlGO4KDM/SQKu/XuuRHafkwLV/5qhAS8Q31+46jtc94ObDye7XMXEawfwMCEiCq2keFpOL3CSRgNU5xkUB3hJpSIni6e7SFNce7n+V5pCy5xMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9C0YTfG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9C0YTfG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2CCFC2BCFA;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784480523;
	bh=5yVsH49bLm+KRqlWEbyRI1pgavGG7dUqYNk7iEKRH5c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=H9C0YTfGw+mqS3UqQpLW+Wqrv3WzLb890/OEvPYtFQOjAI3eUK+8Ki+yGDDmt5Zri
	 evLlGdq34wTbPaE35HkzYFO3DlZfuaHsxPSlJajGj9P/3ebPv93XyTR3tQ8S1Y0Qy7
	 y2PF4rDFrzgPaEWkQylRf643IrWAFYMpm/YBBUx3ki0vgx8I5m7GG2ZzJNBDf54Lb1
	 oiHzYdFUfMh6iaGj4X1iMO4I1SaksTSiTqptM4TMGulLMXEllY28DneBbwEN7Dix4A
	 VWyc0hNadG5t7e5jBX4OvJ8+KsvFHYSuIlQGrw2VqlRJcov1rYoQs365hkpTy8VV2B
	 UGlVZCsXJC3+A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E89C44520;
	Sun, 19 Jul 2026 17:02:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sun, 19 Jul 2026 19:02:00 +0200
Subject: [PATCH v4 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260719-pixel3-camera-v4-2-48cab1236852@ixit.cz>
References: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
In-Reply-To: <20260719-pixel3-camera-v4-0-48cab1236852@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2039; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=DGM3Fv4RdKtHshwjY+6O56eebAPoOIG36Sp1AU8NOj4=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqXQMKQi3pnILbzVLQKCyvss5gJJWyi0Ec/arN6
 Tebue5oHUuJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCal0DCgAKCRBgAj/E00kg
 ct2pD/9MP4unw/G7okEa8p7tirY4hssCvVwleLlvXgjGiDwfbQu0u1IMPB0AXttoqx9iZLzFE0f
 0wXVJtxMkiWjPM+mQTAn9PJ8nZillBEmNXFORj6+jVEielT0FC3wwFQ9djYj3Sw5N4KFKL9ExnV
 GYj/t+97sVVTMGck6CzlgezyP8MWKVfSr9Ey5sk1OUa1giqqhq9cWkBQMH4DrxkS7xunD7eXXka
 IIGbENeaoLNWql/VaaoZVFo5DfAaeWRXkkz8/O15MDisaViX95EEv848UrrMT0LfTxq3L/+l5vV
 ANkMDJsx74Oj2K296N9z5uYb3fBNzHQtVOhBfLcGy9jbP/ljaznZy4rBeKv8Tnr1qF8hZdb02B0
 Qvn/6fHJBE/Wn5ZFGM+zdqMN3l0dSzsenOtxHXh5EgRBPTa4d6hvkOEEeTKv920ra/29JRt2Fuh
 LQUjsl0Sv8AKSV06NDrfOWOGR7txTEbAcaLSBVE4qInUFe0SrLGVWn1Kec7/UAF5hwvvuW+IbnS
 5P9IMWW1rpk85DGoLqZTiPQXjwNPzXalFV1f1vcpRapBRcceqICCtqwKo/VQLzsOCH8MhdrCbEj
 7nsOEx8Q1YM/GuBm2NP/MbGYzouHjA55oc8RSatr6nCyUUYe94D5q6O9amqp24C+nlfK84v6b8d
 /DwWmAytnXARSPQ==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 flash LED block and describe two white flash LEDs
used for the rear camera.

Configure the LED in flash mode with hardware limits matching the
original device configuration, including maximum current and timeout.

In contrary to downstream, we can control both LEDs separately.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 25 ++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index ad6f61b3baa21..0ce48c4647f17 100644
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
 #include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
 #include "sdm845.dtsi"
 #include "pm8998.dtsi"
 #include "pmi8998.dtsi"
 
 /delete-node/ &mpss_region;
@@ -601,16 +602,40 @@ &pm8998_resin {
 };
 
 &pmi8998_charger {
 	monitored-battery = <&battery>;
 
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	/* upper part */
+	led-0 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <1>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
+	};
+
+	/* bottom part */
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <1500000>;
+		flash-max-timeout-us = <1280000>;
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
2.53.0


