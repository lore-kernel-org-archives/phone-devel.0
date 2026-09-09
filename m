Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A52333F594
	for <phone-devel@vger.kernel.org>; Wed,  9 Sep 2026 03:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788923246; cv=none; b=QysIp26KCTjSm1zsBqRERvnUlwliyYkzHOODk5AJp45dNO4DwPHTBWBGnvtQ6rNYoKC2DHVy1Lb4KwxH0ZjH4TYP95pF72881POpMLbMP1iTVBW3403s2oAWFAUTbaxagMXoE0qeILD0bxdRGLzKb2Rnt80fvcor1ZD054aN9Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788923246; c=relaxed/simple;
	bh=tTl3ytbz+FbDgxH1UCG3yD1IJ7x5IKTL+TqRYjwXgko=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JC/sbSk7OPM0fR7Wq3XNCMe4HQBUCd+lS5cwd2neSf8ol0ayVzVrehDkGPCaPhFrXYKmgH1QnzDcElVdbaSb9HVh8bMii/VJt8vB4a9MXj5IhmbCrJmgUAfX+nryNADEEiS820B0N5zJWXm1o14mjTikKeLeyCXKsRSta8FAx+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=T7255cD1; arc=none smtp.client-ip=185.70.43.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="T7255cD1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1788923232; x=1789182432;
	bh=tTl3ytbz+FbDgxH1UCG3yD1IJ7x5IKTL+TqRYjwXgko=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=T7255cD1xoMq4CMygasGjXkrkOO/KryOaM7m5xeMKdBoYQ9Bh/uYyun985Ig6zjRA
	 rcyULcA6tPMNeiScgpgfMNQm/oAOyXRrKYI5bxO/Eaiedbienz22NbRsEflCi5zd7M
	 AMPDbbwynRj3dHeaCCbH0pVEYLzDX1w77PtCiFIRsU5HoiOGKoa+haeQtH/okp0RXz
	 6IK/QrexDZK9oMIf8H+woISUe2hKm/5kuJG9z2K5B0nzUWEdTBjKZurn/aShyD6A1c
	 A1RzaxWtpD+v88KsD8wPSIhcbyEOl3NgAtfIG8fEQ6nuWidA46vV6lHekyKtSHCv+4
	 dHrla5kHCwFfQ==
Date: Wed, 09 Sep 2026 03:07:08 +0000
To: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
From: Esteban Urrutia <esteuwu@proton.me>
Cc: Nazar Kompanets <xlie7669@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org, Esteban Urrutia <esteuwu@proton.me>
Subject: [PATCH] net: ipa: Add IPA_MEM_STATS_DROP_MODEM memory region
Message-ID: <20260909-ipa-modem-drop-v1-1-0c9664f09c4a@proton.me>
Feedback-ID: 147889766:user:proton
X-Pm-Message-ID: 80c038807791ee02e837e3f320076c110bdca1df
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add this memory region which is used in IPA v5.0 and higher.

Link: https://github.com/LineageOS/android_kernel_qcom_sm8450-modules/commi=
t/fc71d0972a2453cc29f873d723a355a902c6d69c
Co-developed-by: Nazar Kompanets <xlie7669@gmail.com>
Signed-off-by: Nazar Kompanets <xlie7669@gmail.com>
Signed-off-by: Esteban Urrutia <esteuwu@proton.me>
---
From IPA v5.0 onwards, two memory regions for drop stats exist: one for
the AP (that is, the driver) and one for the modem (Q6).
This patch declares this memory region and only allows its presence if
the IPA version is >=3D5.0.
---
 drivers/net/ipa/ipa_mem.c | 1 +
 drivers/net/ipa/ipa_mem.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/ipa/ipa_mem.c b/drivers/net/ipa/ipa_mem.c
index 078d32a18dbf..3000aaa24530 100644
--- a/drivers/net/ipa/ipa_mem.c
+++ b/drivers/net/ipa/ipa_mem.c
@@ -166,6 +166,7 @@ static bool ipa_mem_id_valid(struct ipa *ipa, enum ipa_=
mem_id mem_id)
 =09=09=09return false;
 =09=09break;
=20
+=09case IPA_MEM_MODEM_STATS_DROP:
 =09case IPA_MEM_AP_V4_FILTER:
 =09case IPA_MEM_AP_V6_FILTER:
 =09=09if (version < IPA_VERSION_5_0)
diff --git a/drivers/net/ipa/ipa_mem.h b/drivers/net/ipa/ipa_mem.h
index b25babade787..56703bada07c 100644
--- a/drivers/net/ipa/ipa_mem.h
+++ b/drivers/net/ipa/ipa_mem.h
@@ -68,6 +68,7 @@ enum ipa_mem_id {
 =09IPA_MEM_STATS_QUOTA_AP,=09=09/* 0 canaries, optional (IPA v4.0+) */
 =09IPA_MEM_STATS_TETHERING,=09/* 0 canaries, optional (IPA v4.0+) */
 =09IPA_MEM_STATS_DROP,=09=09/* 0 canaries, optional (IPA v4.0+) */
+=09IPA_MEM_MODEM_STATS_DROP,=09/* 0 canaries, optional (IPA v5.0+) */
 =09/* The next 7 filter and route statistics regions are optional */
 =09IPA_MEM_STATS_V4_FILTER,=09/* 0 canaries (IPA v4.0-v4.2) */
 =09IPA_MEM_STATS_V6_FILTER,=09/* 0 canaries (IPA v4.0-v4.2) */

---
base-commit: a9d7ced84989ec05be09b4b8428759ef60450a0f
change-id: 20260909-ipa-modem-drop-5fe77241c80f

Best regards,
-- =20
Esteban Urrutia <esteuwu@proton.me>


