Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E45C237180;
	Sun,  2 Aug 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697468; cv=none; b=EN/chCVZCxs+UH8jjeCLTdradhlrNL8eQB2SZ0IUBGKdzTCp7gBJ86bZyFpoywI0GPm7w4Su6Hpi7QUJVEC2mJQa+TqoNzL8zLYp84d16dDwE7tiuXrrKVy6frABJReJdnrdHOzn8fVIK4H5UVcOOurKEEJZuAYka5n+rCxa0b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697468; c=relaxed/simple;
	bh=zugU8+y0Yoj+/w5PM+oZxznMMbVN70TW1KMWzz2DKy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ngkCGl8ktUPvIqH+RfUEvUsg6W4jrlzmXVJW3+67sxZPpQgUuRIn99HK+KPioceaIeejNhN2qQI5+HiP/VauAoZlP3wUKZ6rlML/M0/re+CtlKWjrX3Kvu3UGhAr+1XlrqgVBhM0BeHbFd+XCjsJSabou5ZLC0YDu28NkPQFD4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sED3JR35; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sED3JR35"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDF14C2BCFA;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785697467;
	bh=zugU8+y0Yoj+/w5PM+oZxznMMbVN70TW1KMWzz2DKy8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sED3JR35f336Mg0/IJItKKeYkafWzDNFiQ9BKc78RY2BlR5sv4dYLbV6cVEQtM1xU
	 5Dt40y1GUAGZO1gc3WWLM/WOkpkGdcF7NIMK1mcRu08qYoS8LEbAO5UHmD6NpabxF4
	 pap6Tcq1gnDgEFXure5MkQLJDI7Z8HvirBMyuoA93lNPFyC7XhokQfdAdKKht9TZFQ
	 RtHTTlEmUiQDXVl/06p1cfPpmPOkO2nFEQrol0VTTUMN9IVoCzs24J/5f8iUiGHQao
	 AXqy/QvfQzZ2d5vFSHiVYkmipWG+ADUVzKkL2VLaKNw/38hPV3VJrRu1LtSOTLEhfo
	 p3ezOuwbpzhww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8E8C55174;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 03 Aug 2026 02:03:46 +0700
Subject: [PATCH v4 2/7] ARM: dts: qcom: msm8960: add RPM clock controller
 and fix USB clocks
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-msm8960-wifi-v4-2-5ffa27aea39d@smankusors.com>
References: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
In-Reply-To: <20260803-msm8960-wifi-v4-0-5ffa27aea39d@smankusors.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: phone-devel@vger.kernel.org, Rudraksha Gupta <guptarud@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785697465; l=2459;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=iIYYtM55Tx+Y0Xs653xyUTxfQMeNNj1lUSNegdYpWt4=;
 b=vhmy5EWuy52VWKTM+23+rq5IxxrPW3ijYnpDNdMWD3ZDLn6GIt24GLVbTaTZ8kh1dpa+Q+Z3p
 QhVfplEhsy9A1zR0jIQ+trRD6suZV+jfMnYPTf5q36RWPZ7Lh4KeB8m
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

The RPM clock controller manages clocks shared between the application
processor and the RPM firmware, including fabric and bus clocks required
by several peripherals.

With the RPM clock controller now available in the device tree, the USB
controller must explicitly declare its dependency on
RPM_DAYTONA_FABRIC_CLK. Without this declaration, the clock framework
would consider it unused and disable it, breaking USB functionality.

This also corrects the previous misuse of USB_HS1_XCVR_CLK as the core
clock. The XCVR clock is in fact used for PHY/reset handling rather than
as the main core clock.

A similar issue has been observed on APQ8064, where missing the RPM
fabric clock dependency leads to broken USB.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index fd28401cebb5..6ead9fec557a 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -5,6 +5,7 @@
 #include <dt-bindings/clock/qcom,gcc-msm8960.h>
 #include <dt-bindings/reset/qcom,gcc-msm8960.h>
 #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+#include <dt-bindings/clock/qcom,rpmcc.h>
 #include <dt-bindings/mfd/qcom-rpm.h>
 #include <dt-bindings/soc/qcom,gsbi.h>
 
@@ -98,6 +99,16 @@ rpm: rpm@108000 {
 			interrupt-names = "ack",
 					  "err",
 					  "wakeup";
+
+			rpmcc: clock-controller {
+				compatible = "qcom,rpmcc-apq8064",
+					     "qcom,rpmcc";
+				#clock-cells = <1>;
+				clocks = <&pxo_board>,
+					 <&cxo_board>;
+				clock-names = "pxo",
+					      "cxo";
+			};
 		};
 
 		ssbi: ssbi@500000 {
@@ -507,8 +518,12 @@ usb1: usb@12500000 {
 			reg = <0x12500000 0x200>,
 			      <0x12500200 0x200>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS1_H_CLK>,
+				 <&gcc USB_HS1_XCVR_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "fs";
 			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS1_RESET>;

-- 
2.34.1


