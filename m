Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F01375AC8;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772404211; cv=none; b=O+USWlaEzHSnnjVIj64narIpZKaDu7aO+AE3s+jYVlLFclfKfw1tcUWmrZdQtN0tuYOquNatIzLFgCZafqc4B4LKUntVh1DeZ3+rCUDyeUVVuen3k9/FbLIqH6G2XPdE0OtDkzTo0h3RCs9lv6zpH4N779uQBegFBcJUgJmd9Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772404211; c=relaxed/simple;
	bh=52pKGNN4TNlSrHich7NbfKBBk9fwTK/SXR3zBV3FT3E=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NIWKdIVVEdjnfS4R/VPakkr4zvw/YQY0q0REXVbk2QQKIUJFCCIOBhcCvChB3diiV5qt1sHnCdO/OuX+GBkTG7S37XB9CNIx4DVwAUXKEncp9VDeOcIuFK4NgwxJlnno+ieU+WZSN1/23uDat5AjueoDNvmeTOrIN0RrBtiZvVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ROvCFj24; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ROvCFj24"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B69A8C2BC87;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772404210;
	bh=52pKGNN4TNlSrHich7NbfKBBk9fwTK/SXR3zBV3FT3E=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ROvCFj24eYksrgSGv4Y2fMx5OGeZGdeOF6yGfdP/1Vye99AynKPQHjlCWuvixq7Kj
	 Ro3aq4IxBugIb2dBmWmenH6SiBWkDgwxI6f23VNhsyuDOfxIklI6CiTTt/8gFOXCLQ
	 OCsrLjPOT+vakrTiaRiD+1mcgo4uOlmR3GhjlqDdqeDdXCiVYkP6apZSt3cx1j8Lw8
	 qvgXP+bcBvVD8qPsL1U9qL8bsu6nzhJJHBc0aS59aeEKz7Gc06nmgoBTUSAp0d2YNz
	 0cqpA9LpPSEJvZ6krrgF6fIe8I3cZ+iOJx1xdB/zuqj7utZ38xiKrF3jLZxtl3u0OF
	 TNhnMA5+rOtJg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 971F9FD0076;
	Sun,  1 Mar 2026 22:30:10 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Subject: [PATCH v3 0/3] Add wiko-chuppito devictree
Date: Sun, 01 Mar 2026 23:29:16 +0100
Message-Id: <20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALy9pGkC/3XMQQ6CMBCF4auQrq1pp1gLK+9hXBQYZGJCmxarh
 nB3Cyti4vK95PtnFjEQRlYXMwuYKJIb81CHgrWDHe/IqcubgQAtQJ74ix6Ot8PTe5oct2hsX5p
 SoT6zbHzAnt5b73rLe6A4ufDZ8kmu779SklzwClE3ptJCW3HxLk7ojh2ytZRgp0H+ashaK6Ub2
 UhQptrrZVm+Q6YRKugAAAA=
X-Change-ID: 20260215-wiko-chuppito-ae8af4843e67
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772404208; l=2007;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=52pKGNN4TNlSrHich7NbfKBBk9fwTK/SXR3zBV3FT3E=;
 b=G5ivJgRS1w6zpqGb+Rwwp67XJVl/Qfvv9Uy/aAIO2PJrFCb4Jnsy258R0mJmsr474HiaXltNw
 lpYskhgGTCaADjkVbJ4iE3dGeujLXlKhNy5Yh29yPcZltW1mEsuGYzl
X-Developer-Key: i=adamp@posteo.de; a=ed25519;
 pk=mtrPhSn7htywc4S5zrKNrWM6laAdfnaJzIs0BDiCyAs=
X-Endpoint-Received: by B4 Relay for adamp@posteo.de/20260215 with
 auth_id=640
X-Original-From: Paul Adam <adamp@posteo.de>
Reply-To: adamp@posteo.de

Add bindings vor Wiko SAS and wiko-chuppito
which are used in the devicetree.

Then introduce an initial device tree for Wiko PULP 4G.
Includes support for:
- UART
- USB (no OTG)
- Internal storage
- MicroSD
- Volume keys + Power button
- Touchscreen
- Backlight
- Accelerometer: Invensense MPU6880
- Magnetometer: Asahi Kasei AK09911
- Hall sensor: Rohm BU52021HFV
- Proximity sensor
- Vibrator
- Earpiece
- Microphone 1
- Headphones
- Wifi
- Bluetooth
- GPU

Signed-off-by: Paul Adam <adamp@posteo.de>
---
Changes in v3:
- add a short description of the device to the patch adding the binding
- removed unused backlight pinctrl state
- readd gpio prefix for some nodes, instead remove it from the labels
- add newline before status properties
- reorder nodes alphabetically
- rename rmi4 node to touchscreen
- Link to v2:
https://lore.kernel.org/r/20260221-wiko-chuppito-v2-0-6336b1b12389@posteo.de

Changes in v2:
- changed company website link to wiko.com (which is just the chinese
version, changing the language redirects to wikomobile.com)
- fix minor dts styling issues
- drop gpio prefix for some nodes
- confirmed stk3310 to be correct
- remove l6: regulator-always-on
- remove gcc node
- Link to v1:
https://lore.kernel.org/r/20260215-wiko-chuppito-v1-0-9ee6b89606a0@posteo.de

---
Paul Adam (3):
      dt-bindings: vendor-prefixes: add WIKO SAS
      dt-bindings: arm: qcom: add wiko,chuppito compatible string
      arm64: dts: qcom: msm8916-wiko-chuppito: add initial devicetree

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 356 +++++++++++++++++++++
 4 files changed, 360 insertions(+)
---
base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
change-id: 20260215-wiko-chuppito-ae8af4843e67

Best regards,
-- 
Paul Adam <adamp@posteo.de>


