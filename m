Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60A31AF07;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784818500; cv=none; b=HHYH8XYJS+ERvkWBAKMtw75VU5hJprqgnRCYVYuRf8Vz/0xUKZI7UqvqtHZb2++WIqXqRb2cjooQ80ih2g8xfRrdwEySiB83DuszDF3W4McMnQb4JZ67k7578sYugvDNM48G7R/xox/bMoee80kCvcbIZB9Efnh7oUlw4pZDOzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784818500; c=relaxed/simple;
	bh=bkBPbgCG+JwsJ/4CRQTu9uoshFqb+X/VXg4zAFDbW6A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=anmUNmMUPZc6Hy4PjBe9wKi760pCcktESumcnmX9ZU5vlXCcja8xAnpi5b589WCsL4QeS6nhNod9odwr6XSIV5mFJbXRRUlIq6hTCfLiH6X3DXwtiNF0Q0Qgy8e7gy70fG+Lo1NZrWrLSyncMj+QBnbN5ZnFnb2F6MfwTIF9x/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q2XRtq8K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q2XRtq8K"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A52C5C2BCB8;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784818499;
	bh=bkBPbgCG+JwsJ/4CRQTu9uoshFqb+X/VXg4zAFDbW6A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Q2XRtq8Kf94ZiBQywuSfLiivAp4s+bokNWL3q2x38uSQ35tkplzDvpY5goU7nQGK9
	 iQhn7/V99DkaXS/W2Tar8l0spQKETuPGCbrJLJ1MQiWQegBlMDPWvxTUmfo/j6fPJ2
	 Fa+DTplPJPSK+aP27LoKaGQM/CAWqwtcO4YucNsujlKWqmeI4PMaF2lIGMSHtbQIId
	 4AuKdcgx505iAbMlard4adL2bDcNiVFsLIdWiDFunrZ8hv2bxReCHpVNj8J14nFXKb
	 RQywNh4A5skC8gkg36mI5Pg2sjNaAI4I/YaFJXg2QkGHxXBxSVIZ47sPQZZJ6AJdfN
	 adShn+B77EFHw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F1DAC531D1;
	Thu, 23 Jul 2026 14:54:59 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH 0/2] PM8350B LDO support
Date: Thu, 23 Jul 2026 10:53:51 -0400
Message-Id: <20260723-pm8350b-ldo-v1-0-42b5428a0d3f@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMSQ5AQBBA0atIrXXSSgxxFbHooVBiSjciEXfXW
 L7F/xd4ckwequgCRwd7XuaAJI7A9GruSLANBpSYywJTsU5lmkktRruIokTUqrU5ZQZCsTpq+fx
 udfPb73ogs70LuO8HrkmlK28AAAA=
X-Change-ID: 20260723-pm8350b-ldo-7822bafd6e5c
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784818498; l=1005;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=bkBPbgCG+JwsJ/4CRQTu9uoshFqb+X/VXg4zAFDbW6A=;
 b=fYb5im4/MAI/XaEnIC8H+Hcm67yn2KYKv/Hx45tEz0gVAahSZh1uBkCrYAYFvieNn4TIibOwU
 +oL9Rml89bDD7X96HIJ4sCXGMU7qYvohKXxFGeRqYGwpmzOd2/eWdoP
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

The PM8350B PMIC has an LDO regulator which seems to be mostly used for
powering display driver ICs.
On my device's schematics, vdd-l1-supply is represented as VIN_DDIC, and
vdd-l1 is represented as VREG_DDIC.
Downstream this LDO is of type pmic5-ldo and I assume it should be of
type pmic5_nldo upstream, since this is the type of regulator with the
least margin error for the reference voltage, which is 1250-1296mV for
my device.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Esteban Urrutia (2):
      regulator: dt-bindings: qcom,rpmh: Add support for PM8350B
      regulator: qcom-rpmh: Add support for PM8350B

 .../devicetree/bindings/regulator/qcom,rpmh-regulator.yaml    | 11 +++++++++++
 drivers/regulator/qcom-rpmh-regulator.c                       |  9 +++++++++
 2 files changed, 20 insertions(+)
---
base-commit: b4515cf4156356e8f4fe6e0fdc17f59adab9772f
change-id: 20260723-pm8350b-ldo-7822bafd6e5c

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


