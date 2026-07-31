Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85D23ED5E;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785474173; cv=none; b=cfpfwwVT1Pf/b3LkkLBzXaXKHbzyKtjPDu9CmYqmTXMlp/zjhn7LtsBbhCZOqCBANIV4MpOoClBze8tVgv+6ohGIuApi0Uy0w2tYA2MGmR5f/FcE18wEroiG7NDz2FU7Yr64eCk+2jmdV4I1ceOm1MUoI7Hj4JpOr8gt7mj8USE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785474173; c=relaxed/simple;
	bh=tCQMQynamuZb93GgzmEQI0iJPGc/haOH3L07MnVnM18=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QuHtQ2eq3qfgroPA/1MiMxyArDArRQlHsa+KaHWfpottBEfKY6Em8k5E/GNk3g/X52G1pg3xVZWWChMVDwfF/aCWN1ilOSlQmxLAKpUYpFRXA4sfS/18nbB9rAFteR2ibtjjtJ4p7b1JPrCAK8GLaFNIt9TyF19bj6It91YXUi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pphP48EY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pphP48EY"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 22128C2BCB9;
	Fri, 31 Jul 2026 05:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785474173;
	bh=tCQMQynamuZb93GgzmEQI0iJPGc/haOH3L07MnVnM18=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=pphP48EYHJpK38NE1PeGUT5zdxMIno6LKZ5VpcnKOIheHdZvnCGsNgiEBD3Y80lE8
	 cJ2mJNbBTBRRMNQMXq/nHvwavQF+ePtVyXIQrrQurv/SaSuK8hqycf4P84uYYqmzB3
	 EkeqBk7k86i4obbgU5NcrJjPvauF2lmcyz0f9jS7IXkGwr4Z1R5YA+CW5gOAz3DDp7
	 58KHEFVLSK0WyZSaU9eT7ECEXolYqIyWdxmL5AYF7e6SuTVv8C7y5csMN1mdbJqrKQ
	 rf4w1v8mRqFf74YOa5x1OnbZdyKOlHnb/JgMRHJEMves/burdNcRgdmJd0S5eSVlVI
	 QuLznvtfG43WA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E891BC5516D;
	Fri, 31 Jul 2026 05:02:52 +0000 (UTC)
From: Esteban Urrutia via B4 Relay <devnull+esteuwu.proton.me@kernel.org>
Subject: [PATCH v2 0/2] Support for pmic-glink in SM8475
Date: Fri, 31 Jul 2026 01:00:07 -0400
Message-Id: <20260731-sm8475-pmic-glink-v2-0-28c04928ef22@proton.me>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7ZhSgYIr72FYSDvAqLSkRaIh3
 F2Ke5cvef/9BQJ5pgDnZAFPMwd2dgN5SED3N9sRstkYpJCFULLCMJSZynEcWGP3ZPvAXFFetFV
 pZHOCbTd6avm9N6/1j8OruZOeYigaPYfJ+c9+OqfR+9efUxSoJaVVobTIDF1G7yZnjwNBva7rF
 9wK0/7EAAAA
X-Change-ID: 20260729-sm8475-pmic-glink-57e56f98d2b3
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
 phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785474171; l=1031;
 i=esteuwu@proton.me; s=20260622; h=from:subject:message-id;
 bh=tCQMQynamuZb93GgzmEQI0iJPGc/haOH3L07MnVnM18=;
 b=2AyEu5HVAIR6qRAU+mqy469PFQLYKXnY6KpJsh67ouPlPlrgemyR63UV0vxulTTFBeYFlBq2F
 jfADcsR3EVCBfp8/9pIJ/czsGMGxzs+cEujpc09sJwUOjk4qUv3WL+1
X-Developer-Key: i=esteuwu@proton.me; a=ed25519;
 pk=wToFt4mOAWkzbqb15Ye1hrhevI13vK9BcMUFiQ/me1M=
X-Endpoint-Received: by B4 Relay for esteuwu@proton.me/20260622 with
 auth_id=835
X-Original-From: Esteban Urrutia <esteuwu@proton.me>
Reply-To: esteuwu@proton.me

This series adds a compatible string for SM8475 for supporting
pmic-glink.
This way, confusion is avoided, because SM8475 takes most
(CPU/GPU/reserved-memory/etc.) things from SM8450 and some (PHY/eUSB)
from SM8550.
Instead of using one or the other, add a different compatible string.

Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
Changes in v2:
- Apply suggestions from Krzysztof
- Link to v1: https://patch.msgid.link/20260729-sm8475-pmic-glink-v1-0-c2e1967c04de@proton.me

---
Esteban Urrutia (2):
      dt-bindings: soc: qcom: qcom,pmic-glink: Add compatible string for SM8475
      usb: typec: ucsi: ucsi_glink: Add compatible string for SM8475

 Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml | 1 +
 drivers/usb/typec/ucsi/ucsi_glink.c                             | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260729-sm8475-pmic-glink-57e56f98d2b3

Best regards,
--  
Esteban Urrutia <esteuwu@proton.me>


