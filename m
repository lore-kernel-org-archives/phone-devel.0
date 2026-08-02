Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E8493264C2;
	Sun,  2 Aug 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697468; cv=none; b=EusWzKbVK8K1zim/l05XRhnQnQAjPCmcUppjG5hcmOM5OxfeHKnSu8Fsbl5PGamMD0xKTRGXs+aRgG2jTpX4Ud/mhPFIK97LHsCMqLhuNrSOBrXkG6HfeqB2LXEHs6CoA1O7g30zkIfzHUCLrvVIs++jS4YxgnjZPA8ct3PDaEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697468; c=relaxed/simple;
	bh=khCqX8lJFWK/GgSlxtmKqSrnQG3SMsT8JoAlUswSW/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cvT+G5ZsXtYEYiQaPAVmJer4ZlRjRpLrOfw0hOwKIxNezMrqYeFgu7oTB6HqJ+O9s9er6NesMGYWVwv27jSRCQ4VNhcYkGZCRTAqtXxH4cmaXsyhIDKUeDBnotOkTYmn95IDTfQAnvR6s/4umUevY5M61PV3TnDjnVnB3gms9zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mu9/w4FG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mu9/w4FG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5C78C32786;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785697468;
	bh=khCqX8lJFWK/GgSlxtmKqSrnQG3SMsT8JoAlUswSW/c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Mu9/w4FGDmBRPIHScDRwqKGylarzijdkoFZnmyWb0duFf1HouJYmx1KmzL862COid
	 vfOqARLQu4T3DfidrXmxRLiJjoGW2taBw9fjgP6tXBal7KwcassJ1G0eiaOlHom3tX
	 9jv9ziVkR9cycjecW1Udz7peI0sp7GZIu7LPCyCjIfehlCnQiCSIKxeUcOvTRbIKAf
	 XytMYkYvCb0cwqyoJBRKnGG5esr+rGnWLgGkGM6pySR7Y8tB/GqkQy3Bt328YMIfW4
	 YlhdufvTgsne348JZCSt6wjMUu4mNdlSWlL9PtfdxNdfxQKqKri9q0wTZyyKFW+FCK
	 BYQPRN4AI9DEQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1C1CC55189;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 03 Aug 2026 02:03:50 +0700
Subject: [PATCH v4 6/7] ARM: dts: qcom: msm8960: add Riva
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-msm8960-wifi-v4-6-5ffa27aea39d@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785697466; l=3618;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=fr3rjZlQXngheXwD/mNnh2DPhB8LO+v93yIQFztu+no=;
 b=yk4Np48JMaXShJk2qbf/Z7G/8CWvHJksGcu7I2gFPYuX9bkwjHBZL2l3FiaehFFc/1LYnk2hD
 Kt8eSKAhsW+Cy0xya4dfix40yyvyKIIlbJCZ5JBhy1INya0tH0Tg64Y
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Riva Peripheral Image Loader node to support the Wireless
Connectivity and Networking Subsystem on MSM8960. This includes:

- Reserved memory region for WCNSS firmware
- WCN3660 iris radio controller
- Bluetooth and Wi-Fi sub-devices exposed via the SMD edge
- Pinctrl states for Bluetooth and Wi-Fi power management

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 87 ++++++++++++++++++++++++++++++++
 1 file changed, 87 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 0088381d77ea..b9c28e468d32 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -100,6 +100,11 @@ smem_region: smem@80000000 {
 			reg = <0x80000000 0x200000>;
 			no-map;
 		};
+
+		wcnss_mem: wcnss@8f000000 {
+			reg = <0x8f000000 0x700000>;
+			no-map;
+		};
 	};
 
 	smem {
@@ -320,6 +325,34 @@ i2c12-pins {
 				};
 			};
 
+			riva_bt_default_state: riva-bt-active-state {
+				pins = "gpio28", "gpio29";
+				function = "bt";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			riva_bt_sleep_state: riva-bt-sleep-state {
+				pins = "gpio28", "gpio29";
+				function = "bt";
+				drive-strength = <2>;
+				bias-pull-down;
+			};
+
+			riva_wlan_default_state: riva-wlan-active-state {
+				pins = "gpio84", "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "wlan";
+				drive-strength = <6>;
+				bias-pull-down;
+			};
+
+			riva_wlan_sleep_state: riva-wlan-sleep-state {
+				pins = "gpio84", "gpio85", "gpio86", "gpio87", "gpio88";
+				function = "wlan";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+
 			sdcc3_default_state: sdcc3-default-state {
 				clk-pins {
 					pins = "sdc3_clk";
@@ -459,6 +492,60 @@ saw1_vreg: regulator {
 			};
 		};
 
+		riva: riva-pil@3200800 {
+			compatible = "qcom,riva-pil";
+			reg = <0x03200800 0x1000>,
+			      <0x03202000 0x2000>,
+			      <0x03204000 0x100>;
+			reg-names = "ccu",
+				    "dxe",
+				    "pmu";
+			pinctrl-0 = <&riva_wlan_default_state>, <&riva_bt_default_state>;
+			pinctrl-1 = <&riva_wlan_sleep_state>, <&riva_bt_sleep_state>;
+			pinctrl-names = "default", "sleep";
+			interrupts-extended = <&intc GIC_SPI 199 IRQ_TYPE_EDGE_RISING>,
+					      <&wcnss_smsm 6 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "wdog", "fatal";
+			memory-region = <&wcnss_mem>;
+
+			status = "disabled";
+
+			iris {
+				compatible = "qcom,wcn3660";
+				clocks = <&cxo_board>;
+				clock-names = "xo";
+			};
+
+			smd-edge {
+				interrupts = <GIC_SPI 198 IRQ_TYPE_EDGE_RISING>;
+				label = "riva";
+				qcom,ipc = <&l2cc 8 25>;
+				qcom,smd-edge = <6>;
+
+				wcnss {
+					compatible = "qcom,wcnss";
+					qcom,smd-channels = "WCNSS_CTRL";
+					qcom,mmio = <&riva>;
+
+					bluetooth {
+						compatible = "qcom,wcnss-bt";
+					};
+
+					wifi {
+						compatible = "qcom,wcnss-wlan";
+						interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>,
+							     <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
+						interrupt-names = "tx",
+								  "rx";
+						qcom,smem-states = <&apps_smsm 10>,
+								   <&apps_smsm 9>;
+						qcom,smem-state-names = "tx-enable",
+									"tx-rings-empty";
+					};
+				};
+			};
+		};
+
 		clock-controller@4000000 {
 			compatible = "qcom,mmcc-msm8960";
 			reg = <0x4000000 0x1000>;

-- 
2.34.1


