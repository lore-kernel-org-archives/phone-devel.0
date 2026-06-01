Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F4D282F38
	for <phone-devel@vger.kernel.org>; Mon,  1 Jun 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780314758; cv=none; b=HIBlvzT5QmR8Tf6QS6ulNh3iR3edVW+KUd8yjKcF3HfvYRjzsKYqvJyM47ztKJx0n3CphH3UNT8zUxTrW/VGq/1lHFDUarFrm7o52JP4dBFg1nB+K831FlSQNeaHtHYXjdTEm9+8c+7PwZx7t+MzP8j9v7Kut2D1Y5IhNRsJDFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780314758; c=relaxed/simple;
	bh=LC1KEiCh5cgS0hAeF9Hre6xCEkCl5eQod5RNmlL42C0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BkY2P6VuKXIlZgRjJUcroprUnpPMK7CcVn1mrf6qYuUItdYFhkAtLHjE8CdLFfKPxoLWAgIbLL708RMzrDfqMikgfJwzaqTMJI7wyV1fW72+CGO8ENnl3at3RE3ZuC2ADeuZPjzVoO+DTSOk8Y1kwBlUkCD+sRBnkb76D7HFrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRlW/BUR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRlW/BUR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6A6B6C2BCB8;
	Mon,  1 Jun 2026 11:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780314758;
	bh=LC1KEiCh5cgS0hAeF9Hre6xCEkCl5eQod5RNmlL42C0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uRlW/BUREnH01u7Q5RpM4t+I9+Bms8GSX19htH45Qt/6Gwnk+BwkfwKofwbsKzNfY
	 0ZHTSWHo3bwQpTF5MvgIHr6ejM+uOsvS58XSyR2HShN1zZSM75h+mS0HBiZ5Q9obAQ
	 NSV0MdPac2RBzcgn/Cq2KmYTQ/+spai6Nk5uxNDGsofySb99dcPZMdnLJ2LyPkxPUk
	 8Qx7sMjtkEWiMO16qFOGTjFpl4qJPRazOwnTlnyqfkkrLd+rsbwtB8iKYWI+BN/mJh
	 H6XSxB4g1cYQdKdTyk5wyJ7Sio2frEWB2ZNIpVPGNtv4qRl/jbXiKIlbqz+3vp0k8M
	 JkV9LoOspJahg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6261DCD5BD1;
	Mon,  1 Jun 2026 11:52:38 +0000 (UTC)
From: Petr Hodina via B4 Relay <devnull+petr.hodina.protonmail.com@kernel.org>
Subject: [PATCH 0/2] Add gpio configuration support for Qualcomm Snapdragon
 platform
Date: Mon, 01 Jun 2026 13:52:34 +0200
Message-Id: <20260601-qcom-gpio-v1-0-e24bcdb35da0@protonmail.com>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIJyHWoC/yXM3wpAMBSA8VdZ59pqFvPnVeSCOTiKzYaUvLvh8
 ldf3wUeHaGHkl3g8CBPZgmIIwZ6bJYBOXXBIIVUQomYr9rMfLBkeJFjnjatlCrJIPTWYU/n96r
 q335vJ9TbO4D7fgC9coBLbQAAAA==
X-Change-ID: 20260601-qcom-gpio-98e85ab22647
To: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, 
 u-boot@lists.denx.de
Cc: Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
 Rui Miguel Silva <rui.silva@linaro.org>, phone-devel@vger.kernel.org, 
 Petr Hodina <petr.hodina@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780314756; l=757;
 i=petr.hodina@protonmail.com; s=20260107; h=from:subject:message-id;
 bh=LC1KEiCh5cgS0hAeF9Hre6xCEkCl5eQod5RNmlL42C0=;
 b=GFU5sZU4RsOg0hvvaDb1hts/0dp1shvPTEM5/i9o6RVwFVP2eFSX8nTTtgWdyIxWmR/2GOcXr
 xOjizHsZ/JVBo7q3sMlUKS90D++x8HFfkHvmoV1nI627+TeU/nuo8Ax
X-Developer-Key: i=petr.hodina@protonmail.com; a=ed25519;
 pk=3QaVc6AaAu1IsyyH86+LIOOFhD7kCws8Xhe+wwyE7Bg=
X-Endpoint-Received: by B4 Relay for petr.hodina@protonmail.com/20260107
 with auth_id=594
X-Original-From: Petr Hodina <petr.hodina@protonmail.com>
Reply-To: petr.hodina@protonmail.com

This patch series adds the gpio configuration as input along with
pull-up/down/disable and drive strength for output.

Remove the reconfiguration from the set_direction.

This enables on mainline Linux phones to use volume-up in menu.

Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
---
Petr Hodina (2):
      gpio: qcom_pmic_gpio: implement standard pinconf parameters
      gpio: qcom_pmic_gpio: don't reset pull on direction change

 drivers/gpio/qcom_pmic_gpio.c | 41 ++++++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 9 deletions(-)
---
base-commit: 1f89ddd61cd8c27a3dc1fc7edbeccb55d424eb72
change-id: 20260601-qcom-gpio-98e85ab22647

Best regards,
--  
Petr Hodina <petr.hodina@protonmail.com>


