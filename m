Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BED4A41;
	Tue, 18 Nov 2025 00:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763424363; cv=none; b=nEHqBZ0q9QmVLIZrDgyyNeT6wNvxArj0e9TMOfwCj4ZC1XnDZai32rL8mjP6ev7AkUAN9vVAF+a8WYoC3tw6rfD6jbTWjlGHroJLO+gRzi/7WMycBhot3kkPMHENWytCxC1XWiBOiZKQU6Skg3rzpY7mmT5phloUFTr81RHkUOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763424363; c=relaxed/simple;
	bh=idLT3Sl3hq972dwsE+XR7Moq7/70O5GW00jrAtyDqL8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RAFx0DX53+S6A3N8xKs/m+IDZztb6zptFcahcyg9AyJYY3sVJ1fXHGX8LQu2e6K/YMdwfTG5lCqCcR3SU5jW26fLgY5unTWYnWy7mgpz0cU707OEf4RqYD4UebuEpu+FqHGw5TNvdKyrSkaea7XvtRmRAtp+0qO8O/qL2faz8Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OA5b6RS7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OA5b6RS7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BA85AC113D0;
	Tue, 18 Nov 2025 00:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763424360;
	bh=idLT3Sl3hq972dwsE+XR7Moq7/70O5GW00jrAtyDqL8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=OA5b6RS7emS/mHRyEnDu1izqu7MSozCXz3w6g2ripeMt+xV8s8GdFrWIUB6CLuw6O
	 dZzXcgnCwxv+s6GDWpwdNTmp0zld42SRHL7oSNJ0OhYiZX6o1NWlXXBSgcDjpw9fQc
	 AbBYXBq6FGTQcBnB/R7E/czQxCD4v1HsJ8hWbJKzFrJaa7u0PKhujCUf10mycFTlyD
	 lqkuPIBWv7XXdGXyZ/gagYTzuLPiS/cLbknNp+0W9di5vbKjDesmU9qxNxIVwQp/Bf
	 gm6H8oKfnRJ8AYjnBPPwRDNRLYywO/DO0L9WpyrHWSrTI61jXcHol3UTWEZP3SKjDU
	 tZ0qdAGKTa1NA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84848CEBF92;
	Tue, 18 Nov 2025 00:06:00 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 01:05:57 +0100
Subject: [PATCH] mm/vmalloc: warn only once when vmalloc detect invalid gfp
 flags
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAGS4G2kC/x2MQQqAIBAAvxJ7TmilKPtKdDDdasE0FKKQ/p50G
 ZjDTIZEkSnBWGWIdHHi4ItgXYHZtd9IsC0OspEdIg4iePcUkLgO7VwwYhmsUn3Tdr1CKNkZaeX
 7X07z+37nDonqYgAAAA==
X-Change-ID: 20251118-only-one-vmalloc-b8d997045791
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1266; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=+3LV6m3PqRpzFWM6pdP/J/h+Ov5Mmi3IXlzFVsT12F0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpG7hnPrb694PSAtJVrUC41ulsIGwk2mg7uisJn
 XnAjQL2gKSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRu4ZwAKCRBgAj/E00kg
 cqr2D/9RDSNedfot2LwKkIjnQ1JC5RtS0l4ZwgScYSeT8uLysnaMH8XbHHvgZ2HrEvIvSi1DmYN
 +lRq3yAQDBbAZGPheBtnhq0KR4Tq1vUMg+VUiTjjESM3aPuNZDVTzHSmdFrKNBCq21Rmsa1zCWa
 BXBoMKH/u10LIAn5cYYim3gMZYeTPL9lSsAbIkrnIkWFQnsZ8Gg7xm+3j4EldkLpWYwR2m+NL38
 jsUBtlCxTukzD030BYcXChxL5vTSUa5jYxeZm9l4h5RP8/6C159fE9EJjSI3KVjVRHO8/9P5o/P
 /yRU/gvp90rpTY6iRdMaFhsYcOxJXeCMXvyTJ6tGKLH4b0rP+VicjBzf6rzXEFKAelUEX6VxY3K
 7qQ0a4KdV7Z7SFOsShotfcZpgH8HWKX5dJxe3wK40Fue+1WzmLfo2gXpf73pLk6/xGjDnodbLem
 Hl9s9W3jnlpbKr7fMbcfW2GSDhK+okv4u84GPYIIK5IMPBDxACjYgouhFxS3SFm8yZDTdF2QtBd
 +DsTlLuL7DaVQlhsYr8vuBxKhyTEkll3U4FTSznfMqaHNqnKBHHgJIecFWfPDoCtaLUPTSPkQ75
 bF4b45mzh/e5Xge43nUsHoJ8JQB/r9KIXXnjsKGLZCy1IGgwbmBS7AAa0XIcMGddxIXT++TFqu1
 ToK0FBKpdHKOnfA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

From: David Heidelberg <david@ixit.cz>

Without WARN_ONCE, the logs get spammed immediately after the boot,
on devices as OnePlus 6T (Snapdragon 845).

Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
Signed-off-by: David Heidelberg <david@ixit.cz>
---
I'm not 100% sure this is the right solution, but having WARN_ONCE or
rate limited warnings here helps a lot on devices as OnePlus 6 (sdm845).

Please let me know what you think.
---
 mm/vmalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 49e0b68768d73..2a3ee17093d6e 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3934,8 +3934,8 @@ static gfp_t vmalloc_fix_flags(gfp_t flags)
 	gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
 
 	flags &= GFP_VMALLOC_SUPPORTED;
-	WARN(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n",
-			invalid_mask, &invalid_mask, flags, &flags);
+	WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n"
+		  invalid_mask, &invalid_mask, flags, &flags);
 	return flags;
 }
 

---
base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
change-id: 20251118-only-one-vmalloc-b8d997045791

Best regards,
-- 
David Heidelberg <david@ixit.cz>


