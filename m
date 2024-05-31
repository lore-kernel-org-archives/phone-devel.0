Received: from smtp1.ms.mff.cuni.cz (smtp-in1.ms.mff.cuni.cz [195.113.20.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 632391DFCB
	for <phone-devel@vger.kernel.org>; Fri, 31 May 2024 17:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.113.20.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717177984; cv=none; b=GtxgW/AZa9yxOND4M9lOFb6HAHBv1gNwWShLA5BeocSG+76h3mklAaggrdZKjzaWUu8HNuVHotJzpbPn+EmjYr7qQL+oAd7O1vwpLmVVH3BMUqp9hdt7FXHGQF/yA9xFQ3qLNBfORHNMPTUMiHclqlvd7V7wVCZzfa9m03LW/3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717177984; c=relaxed/simple;
	bh=/1bazwq8/5ZIffTP9cbZUkwd86uwrXjzRtAHrHiL2vk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hiyw5eXjlaQS9wSU0YJzQ3wb9xlf6bkjdM2CUGPNE44onilUNIfxhA0qKv+DAYIA3QN4Phsz46bC4xzd32KWYLMfmuRkLxNR3sSrZDNB+qnr1IxJRmryWJOwHM+sPVboLG81AOHX5pRbt2HoR2oLmrSNBdjLZ0jUFVxuSDuu7OA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz; spf=pass smtp.mailfrom=matfyz.cz; dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b=WhhlDm8+; arc=none smtp.client-ip=195.113.20.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matfyz.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mff.cuni.cz header.i=@mff.cuni.cz header.b="WhhlDm8+"
X-SubmittedBy: id balejk@matfyz.cz subject /postalCode=110+2000/O=Univerzita+20Karlova/street=Ovocn+5CxC3+5CxBD+20trh+20560/5/ST=Praha,+20Hlavn+5CxC3+5CxAD+20m+5CxC4+5Cx9Bsto/C=CZ/CN=Karel+20Balej/emailAddress=balejk@matfyz.cz
	serial F5FD910E8FE2121B897F7E55B84E351D
	issued by /C=NL/O=GEANT+20Vereniging/CN=GEANT+20Personal+20CA+204
	auth type TLS.CUNI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mff.cuni.cz;
	s=submission; t=1717177980; x=1718477980;
	bh=My4LXhXbb9BOpUof0ahRmEdjI75iWQ/EFNjZ8MlgZrg=; h=From;
	b=WhhlDm8+P5hbDnR/U8kiAn2A4f7Zc7v5CVE4/wBGRE+LGHaLdGuWxD0uQZwnhx0GM
	 t+ceQjFzs7EFlqZpFiSt2F+fQapECr0CX+r64YlHztxuB1WSV1RlL9gFsXF+qzhVh0
	 2DlwxSORJiI2ZyqakKq5/rQfO9xJECyYXYeMxMNH/NjQXBJMIQtZmE8Msnacyb2BHN
	 eZXyxEtVtAbOALc/5IXf0mDhdRQKXMTAZKTmb6wFL0fk3AG711Kv8HSWCZCDbzyKyw
	 v7GKfTkiN7qMI8OuYjfLC5mog262Bc7I+H4yDcT8kWXCbaKr8NE0vGVxEv3w5hc26Q
	 XX4GCERRstPsw==
Received: from localhost (internet5.mraknet.com [185.200.108.250])
	(authenticated)
	by smtp1.ms.mff.cuni.cz (8.16.1/8.16.1) with ESMTPS id 44VHqxRU001124
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
	Fri, 31 May 2024 19:53:00 +0200 (CEST)
	(envelope-from balejk@matfyz.cz)
From: Karel Balej <balejk@matfyz.cz>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-input@vger.kernel.org
Cc: =?UTF-8?q?Duje=20Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        balejk@matfyz.cz
Subject: [PATCH v7 5/5] MAINTAINERS: add myself for Marvell 88PM886 PMIC
Date: Fri, 31 May 2024 19:35:00 +0200
Message-ID: <20240531175109.15599-6-balejk@matfyz.cz>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240531175109.15599-1-balejk@matfyz.cz>
References: <20240531175109.15599-1-balejk@matfyz.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry to MAINTAINERS for the Marvell 88PM886 PMIC MFD, onkey and
regulator drivers.

Signed-off-by: Karel Balej <balejk@matfyz.cz>
---

Notes:
    RFC v3:
    - Remove onkey bindings file.
    RFC v2:
    - Only mention 88PM886 in the commit message.
    - Add regulator driver.
    - Rename the entry.

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d6c90161c7bf..9d6c940029b8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13295,6 +13295,15 @@ F:	drivers/net/dsa/mv88e6xxx/
 F:	include/linux/dsa/mv88e6xxx.h
 F:	include/linux/platform_data/mv88e6xxx.h
 
+MARVELL 88PM886 PMIC DRIVER
+M:	Karel Balej <balejk@matfyz.cz>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/marvell,88pm886-a1.yaml
+F:	drivers/input/misc/88pm886-onkey.c
+F:	drivers/mfd/88pm886.c
+F:	drivers/regulators/88pm886-regulator.c
+F:	include/linux/mfd/88pm886.h
+
 MARVELL ARMADA 3700 PHY DRIVERS
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 S:	Maintained
-- 
2.45.1

