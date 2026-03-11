Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2302E3E9F75;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254826; cv=none; b=jjvNZjfW3hYxt9W/33dKlR3M1uo9nz0bHOYZhkjpEq5SX92od/rnG72Wfuk4+75PnLxOPgzA0yFSTNVT2/sA2zkIx/mLxf4iB/TyAFxkImYq73s/sekQ6eg+R6WatWL+tF/pDRaF/95P0Zh9U4Zk63sO6COCGt9hQ974Nm+f5SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254826; c=relaxed/simple;
	bh=dHZg6uOVAaNc1UqMMrSRgbvaCfAJbJ2rt56di9VSDAw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dYQxCdEBCk5OCqnbRVpuzwyhBO8FFMD8iyQSXAS4kPZnaMhb8riZ/TIIbGebjvLxgBgoKO3D/gIPaNyZSx3WARR+CvBNVb0AlddqRUqcqB+c0RjReJqn2zVCYt3yEurb/TsvmRyiN6lflvi39mgUJ2zLw9gy7PDlIpTeuMhPwWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHTbXJKP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHTbXJKP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6A3FC116C6;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773254825;
	bh=dHZg6uOVAaNc1UqMMrSRgbvaCfAJbJ2rt56di9VSDAw=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=AHTbXJKP3QwTPccTIcBay/nF2eTf0ODwrf6AXBk7pgfSN14BoPkswI4Yay2Qw9ly9
	 9k9KxVE0lrD+IC4rAEme2/pOEL9FQNzf4OD8AsmkaPukyUFW9c5dXrVpRguuIkDgE1
	 6pPI1HYsO4+ks1bcxbVQnWaEXJnjpkEZ/FtrECMzQVGJtoPypCJNICiUW0LaJOOgDP
	 9wfsMi1FbycrpWDaFQ/vTkBS462uaWYHa9fuwSkCHVu0Ra0dVSu0v3lAzAFvFAOYxv
	 1uHnKRBnEBMfWri0CoypIE4SFCMsCLFx20wy+mB3S70fPB9h/ro8slJ7S/6aZYRYEu
	 3hrP6bN8osjkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC4171125867;
	Wed, 11 Mar 2026 18:47:05 +0000 (UTC)
From: Paul Adam via B4 Relay <devnull+adamp.posteo.de@kernel.org>
Subject: [PATCH v5 0/3] Add wiko-chuppito devictree
Date: Wed, 11 Mar 2026 19:46:04 +0100
Message-Id: <20260311-wiko-chuppito-v5-0-0a8656cca1b3@posteo.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGy4sWkC/3XNwW6DMAzG8Vepcl6qxAYTeup7VDsYMCOa1CBCa
 SfEuy9wGaLa8bP0+3tWUQYvUV1Osxpk8tGHexr5x0nVHd+/RPsmbQUGyIDN9dN/B113j773Y9A
 sjtvMZShUqGT6QVr/2nq3z7Q7H8cw/Gz5ya7X/0qT1UaXIlS5kgyxufYhjhLOjai1NMFOgz1qS
 JoQqbKVBXTlUeOfRvOmcf1dITFwwdLkR53tdXHUWdIIOddELIhur5dl+QUjmGk3ZAEAAA==
X-Change-ID: 20260215-wiko-chuppito-ae8af4843e67
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, Paul Adam <adamp@posteo.de>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773254823; l=2340;
 i=adamp@posteo.de; s=20260215; h=from:subject:message-id;
 bh=dHZg6uOVAaNc1UqMMrSRgbvaCfAJbJ2rt56di9VSDAw=;
 b=otaCzVhZpHxmffDsa9yndQBD+zIgzTbhdMO7o+CAzdDb/M5LoILC/c5p88k/yEv68ntOUTv3+
 X3XwYrwnhAjCoRDPcoIfhWlcr6JlgnwmlO0GHVX2McUq1LIuhg436Nm
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
Changes in v5:
- remove AMIC3 from audio-routing
- Link to v4: https://lore.kernel.org/r/20260307-wiko-chuppito-v4-0-325ac66ae338@posteo.de

Changes in v4:
- remove unused suspend pinctrl states
- remove regulator-always-on for l6
- Link to v3:
https://lore.kernel.org/r/20260301-wiko-chuppito-v3-0-9b36a2a7aed5@posteo.de

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
 arch/arm64/boot/dts/qcom/msm8916-wiko-chuppito.dts | 314 +++++++++++++++++++++
 4 files changed, 318 insertions(+)
---
base-commit: cee73b1e840c154f64ace682cb477c1ae2e29cc4
change-id: 20260215-wiko-chuppito-ae8af4843e67

Best regards,
-- 
Paul Adam <adamp@posteo.de>


