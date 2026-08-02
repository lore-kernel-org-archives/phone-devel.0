Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA031355B;
	Sun,  2 Aug 2026 19:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785697468; cv=none; b=b4lRw9BMnAbONCm3jUL5EXHhM3C+TbrdHoZYMOdAnXpFROZnN/8fhQbSEZMp7jYEa0xGjUDP5jxmilX6KylgOonbSgEugLP+QLM5RsiJJ9syoOwJbZjbBndqE1Xl4BMok8xHVF5nvfuUUdwaGFCIj878euXVGaMO4lFJ2rJwZ3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785697468; c=relaxed/simple;
	bh=ElyN481v5eQoVY1Y3gg7vcVerEHwdFns7reObbRZr8g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TDTTv8lp0trBQMQPPsYccLkjLwyBk3/IkNXFUzN4XNo9TQN8MF+wWjihj/yduYEtWE5vcDqrHK3J782434ytkC6yJk6Z0KAgX1+sqUNe3gu/61/Fpaze/4U0S6LorHUUNefS6QkOJYrnX+5AtjIKFX4vkKYkRFjojMBILAgsju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nQdMq/8F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nQdMq/8F"
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8CF4C2BCFB;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785697467;
	bh=ElyN481v5eQoVY1Y3gg7vcVerEHwdFns7reObbRZr8g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=nQdMq/8FVgE1yRAsjXCCuX01bN6xrmNNs9a3gqJWZui40a/XCpmlCzBqQMLQv6fPt
	 D3FARKbmJFCV/xPPGUtTfZ5sCNxT/ufZnU99eQ9zOB8z0O+dJoahY3uaxmzJq5qYZ8
	 ZAb0J4sFSRRA+yByhcFJeI9gnlPKCZ8QZZdQNNOzw2RBsta+2n6/qdhZjm/FtvEokH
	 hH7z83a4/toiNDBUxSz5X2ny3PWN5z8AHAznOGsf6M44OPz+Z4G6D6Mf0KBMNoFMSW
	 eTKD3kpViVR2Ov3Rla+/q/kDRbNtbx6sqYwz8DgZJlDL3q6tHeLyzO9oMzuO0SJiHi
	 vo90HK/do8waw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB985C55184;
	Sun,  2 Aug 2026 19:04:27 +0000 (UTC)
From: Antony Kurniawan Soemardi via B4 Relay <devnull+linux.smankusors.com@kernel.org>
Date: Mon, 03 Aug 2026 02:03:47 +0700
Subject: [PATCH v4 3/7] ARM: dts: qcom: msm8960: add SCM
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260803-msm8960-wifi-v4-3-5ffa27aea39d@smankusors.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785697465; l=1008;
 i=linux@smankusors.com; s=20250609; h=from:subject:message-id;
 bh=6qPCxJ060B6XOvr3QmmXdpO9Tte51UAy4LVFZRVscW8=;
 b=7gSUZvGsHd9lEsiq5M7AIjzo8rqjgFn6FJzuUZMrOBlKJEY7adDZLhxunZXPX/34lbv8H/HGJ
 yyvCnJugwl7DAg6BzZgAwRFz7vEUBXnxY2XkSImw7wWcfROgrKEqMT8
X-Developer-Key: i=linux@smankusors.com; a=ed25519;
 pk=65wTy06fJl2/h/EJwjr704YG+yjHFhZObJBWzzK+N00=
X-Endpoint-Received: by B4 Relay for linux@smankusors.com/20250609 with
 auth_id=733
X-Original-From: Antony Kurniawan Soemardi <linux@smankusors.com>
Reply-To: linux@smankusors.com

From: Antony Kurniawan Soemardi <linux@smankusors.com>

Add the Secure Channel Manager firmware device node to the MSM8960
device tree. The SCM is required for secure communication between the
application processor and other subsystems.

Tested-by: Rudraksha Gupta <guptarud@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
---
 arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
index 6ead9fec557a..00957482dee6 100644
--- a/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-msm8960.dtsi
@@ -77,6 +77,15 @@ l2: l2-cache {
 		};
 	};
 
+	firmware {
+		scm {
+			compatible = "qcom,scm-msm8960", "qcom,scm";
+
+			clocks = <&rpmcc RPM_DAYTONA_FABRIC_CLK>;
+			clock-names = "core";
+		};
+	};
+
 	memory@80000000 {
 		device_type = "memory";
 		reg = <0x80000000 0>;

-- 
2.34.1


