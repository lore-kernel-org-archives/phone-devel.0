Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E7022425B;
	Sat, 11 Apr 2026 10:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775902324; cv=none; b=csenuty4ivSQa7ilBVgn8F10jtworaaEd5jMxiAhs80x0RwGd/Gi23d62q+vzfSgP46YN7G4XQ8gu1/ib1xIs/X5AEOwbqqbsW7ptEk+47lnyBQPUnfITTP0i3eog55IdSjrPzSgnchhxl+xYP0gvLj47sCOdYQfkAwQeNdsYVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775902324; c=relaxed/simple;
	bh=q00KISChBRUHNHyaVW48Rtym9t2Uy6m/+GeunCQzPdc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jR6/CfDlnZ0EHbFZ90R8j2nYXFhSO7warlyCKRtIXGv1brWgJBAdpI1j+H/x4LFBcOPtS8KxKgdl5M+gi/SH35lOTB6RSUGMqbrvpZfQcDMM8kUIqldY4mcWLHYaDt6852cJOh0breuYg1wiMW6SB0PozLrvp/C4aJwAvU/Pd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FC32KA5O; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FC32KA5O"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFDA8C2BC9E;
	Sat, 11 Apr 2026 10:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775902324;
	bh=q00KISChBRUHNHyaVW48Rtym9t2Uy6m/+GeunCQzPdc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FC32KA5O81Ka+RQwwhFbiSpFks4AYMu1AyIRB003sTJn8IZ4nrmRW0WeXM7T0uror
	 2M52SFYiTGx2lMuLU4u8PjTktaxMOPAZbXvBTT57dzOXiYg7+KrDq4mthXTwqjv8wp
	 fsLqNLVeh9XTo/xNeAX7SrKsXlLTRlL95lzIsS8Ge9z6ZuXgLHA2v0ZHDar4VzakPm
	 3J1woDp+DFnZfQE8ZKfZYrLL+LwqOd1WTk1IBOa/JpfkXJYF2KuXHEG9k1hLumGfgu
	 ++ZFACr0ctE8cSaPh14lqIc4x2dK+jgyDInt6V8IBUIZ7LyBmmlXaNgrFfeROk0wCt
	 pzD3OWuKMezVA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4560F3ED41;
	Sat, 11 Apr 2026 10:12:03 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Sat, 11 Apr 2026 12:12:03 +0200
Subject: [PATCH v2 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LED
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260411-pixel3-camera-v2-2-41b889abb14c@ixit.cz>
References: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
In-Reply-To: <20260411-pixel3-camera-v2-0-41b889abb14c@ixit.cz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, 
 Richard Acayan <mailingradian@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1378; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=44B67eoSxTZ4WyYriw0YqGPLUibyC/y8pYBqVebOa4c=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBp2h5yVvDHV6k5Xumh1+kFN7pxD1UZOBOqzydjx
 3FrS9aCAxmJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCadoecgAKCRBgAj/E00kg
 ci7vD/95LqSUFUncSITjMTfnlRGGmKSZeYvIlA9JO+X8RnkULCj4mnFRxyJzrh3qS2k8FysVytT
 N1eX0VsTMYhxtF6nWR90mYczbjtZJwjpLZsptGlcCUakYUFh/0jmoObs4OelXu/Qv+MKKFoDMrt
 IoGxxN14aKyJsq0x7uC69DBmzRTtmAcyXr0nx6GlStuiWrPXqeD21A29ntf1Huq+27ysWZmk0va
 zaAb/T1kImVZzBnlqVJ+KjZeoW1SEpI5bH4dH8Juruyf25OiTfndfVoNxnOF9SUMu0QoreZiw3c
 yusAyc9CX5e4/gAjUMkWqP6E7YMtYbVkQAJsDxUw19/GBCR6K5Zn6SPk1R/Hz0D+Fad1tVPyM5t
 UdohnQ86RsY6FgPR/zSzuB/LtpZz2J6usosU4BXFIDd3bpGB/lN/rvSG9rPaGGqgbGX180GbzKl
 JfiJXk5OBJWKC+stbV4hLKKCuE6WPRNskQBQQLkmk5Q0sOgCBhOysxMXhkHrvGGqXKhUNAausDt
 6BqMkwKucnkKll50//vMKwuPQK19kUBSF47DvD0ktfxymeV9+Su4y69YJVpQSEazHEwMuDh2sJl
 tiHxwAuAraiDrf898SgbOwglV6lBkd4Haoi271YoDLK2jJeaes10Lb4XOQBUhPWX/4dW7HUZic4
 N1wWpxp4CJOQYqg==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Enable the PMI8998 flash LED block and describe the white flash LED
used for the rear camera.

Configure the LED in flash mode with hardware limits matching the
original device configuration, including maximum current and timeout.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
index 084058a597c10..44b6d61697caf 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845-google-common.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/input/linux-event-codes.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/leds/common.h>
 #include <dt-bindings/media/video-interfaces.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 
@@ -590,6 +591,19 @@ &pmi8998_charger {
 	status = "okay";
 };
 
+&pmi8998_flash {
+	status = "okay";
+
+	led-1 {
+		function = LED_FUNCTION_FLASH;
+		color = <LED_COLOR_ID_WHITE>;
+		led-sources = <2>;
+		led-max-microamp = <500000>;
+		flash-max-microamp = <750000>;
+		flash-max-timeout-us = <1280000>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.53.0


