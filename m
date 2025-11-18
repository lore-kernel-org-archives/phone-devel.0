Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3084A34EF10;
	Tue, 18 Nov 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763465841; cv=none; b=Xbm89iYxDkelqxZ+jkBEdakdK0N0gQVCFHJmEQjIakgx7PqVIA1d5arDv3E9GInVfWSzFvEiGy0AiH6p/xN85iQf7iBhCyck7KwhSqrDtg7UBWpstNxxB3SMNY5n0fLR8jDeJYtwJ7gOkVc6/nv6HTbff/CtFyh+V7Io5UlgKUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763465841; c=relaxed/simple;
	bh=szJd34lUBHLNu9S3WWAy5BrQumAvduXH2t3XIhEX5zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PzahXVQELHWyvJOHvUoPdVYnvktFBY86yzZuTccUy/8Ip69k7ImIoTT3jR3Dj8J3XZQ2vBYrPTAkmho7gkRal4uWK98ZODy8JaCwmkbZEv84nu0qF1ANDWJvXQc84M3j83gsLsHuOoMiRC7QwVQdn51S78RIFzk+FgEZp7Yp73Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m3/oj6Kt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m3/oj6Kt"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A69FC19425;
	Tue, 18 Nov 2025 11:37:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763465839;
	bh=szJd34lUBHLNu9S3WWAy5BrQumAvduXH2t3XIhEX5zw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=m3/oj6KtwbQaKH8dDXYgw5VwU3rbHBxx+7P3iMX8UaxPoH9oMPkZdKDkUKWE6ajed
	 AStKA3jRiKg1GsomdZklQmZZcH+RR/bZIP1znZlVdlepZih71RKf6AxV3bUdMdAiEr
	 qc6IDq1AGUK1DBVvOIQ/69L1jYVf/eXNImv/+JVcHw90L/iVn0iDD17HGjnmbINYBo
	 1GIZqsG/XpHNtf9Ais8br4WO2fwdVqeMYDn7GC2PYS02+nnkbFRT9tXMHq6Gp9+718
	 5SFA23FAw5CiRR5bL81vV8C9l588TMwdUVgBjgDXal2EH48DXOAMeVxqRP+bXUPahM
	 dq/PtlluM8lpg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42487CED624;
	Tue, 18 Nov 2025 11:37:19 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Tue, 18 Nov 2025 12:37:16 +0100
Subject: [PATCH v2] mm/vmalloc: warn only once when vmalloc detect invalid
 gfp flags
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-only-one-vmalloc-v2-1-fe702aa68d8b@ixit.cz>
X-B4-Tracking: v=1; b=H4sIAGtaHGkC/32NQQqDMBBFryKzbooTtJqueo/iQuNYB9JEEglay
 d2beoBuPrwP//0DAnmmAPfiAE+RAzubQV4K0HNvXyR4zAyylDUitsJZs+cgEd+9MU6LoR2Vasq
 qbhRCni2eJt5O5bPLPHNYnd/Ph4i/9o8sokAh1dRSr4fqVtYP3ni96g90KaUvfHYjVa4AAAA=
X-Change-ID: 20251118-only-one-vmalloc-b8d997045791
To: Andrew Morton <akpm@linux-foundation.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 "Vishal Moola (Oracle)" <vishal.moola@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=54i1YH3FbEzkceweElaDmkfgd6gmC6hf5zbFIJvmoD0=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpHFpuJ+ejYSTUfSbADLtP9gVRTjv696wsmMt5H
 LWLalPK7qOJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRxabgAKCRBgAj/E00kg
 cqaeEACisQrL/b2MB5OMb7gMPoBEJzUnsNF3Y6KJ1b8zABV832iROP4kQ71qBkGr2GUG7olBzyY
 09YY/DGfZrUcnUnAuf/lhBrqg4WXBznjJDudhxk/zLK3Zv8TYmpysA4KLJquV4sJA2mP/em3O40
 yKgJjcuwotuyV8Qe8ofP8tcxCSl2jbA/wcOC93prPbxh/0x9u2lLaj7Tm/wti6iMo7hjVZLr60Z
 4jsMUKGxJy5/wqr+5e2oN9mzZcce7bGtNw7VKQNqyxpZTFbrqmNmoYdWM5d21B5vuY70I/U9ko6
 7mhMDCTIIQeoYiQ1bTrL6hPK1aG4KeLcul2EojTGaVyGAtcYDb7E9u3bLioYJCPJbvgYH27oQHY
 8mO4dfzh1g6EO568QqW6+rBbE95s5Rr+puKLSEyI9DPjl1Ynhzw/Sn5MMXX3jWLlv+4s4wePHu0
 R8NgtmSBOYw8IrwFrbAMk+DYn+6D9pEN81st9xMi3d/f3GaHb5/bVQyh5LgfALbWzDZxWtsUvBM
 o1jIHhbwodFsYTlx6vEP9YzOozUNDf3JDR0txNSvYHqprZgmsXb30+whk4n3eVUYAqBqIcXwRWO
 UB4YC+nqOVcCmAoXMFU0JcfCaUyiMcrUA380gFqUUpMB5rs5Lnix3VDAd2saEUNW9T9N0wjilTe
 khx4navcxX8ASLA==
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
Resend as requested.
---
Changes in v2:
- Fixed accidentally removed comma.
- Link to v1: https://lore.kernel.org/r/20251118-only-one-vmalloc-v1-1-29f8eacb4605@ixit.cz
---
 mm/vmalloc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index 49e0b68768d73..59a4ea8b7f91f 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3934,8 +3934,8 @@ static gfp_t vmalloc_fix_flags(gfp_t flags)
 	gfp_t invalid_mask = flags & ~GFP_VMALLOC_SUPPORTED;
 
 	flags &= GFP_VMALLOC_SUPPORTED;
-	WARN(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n",
-			invalid_mask, &invalid_mask, flags, &flags);
+	WARN_ONCE(1, "Unexpected gfp: %#x (%pGg). Fixing up to gfp: %#x (%pGg). Fix your code!\n",
+		  invalid_mask, &invalid_mask, flags, &flags);
 	return flags;
 }
 

---
base-commit: 0c1c7a6a83feaf2cf182c52983ffe330ffb50280
change-id: 20251118-only-one-vmalloc-b8d997045791

Best regards,
-- 
David Heidelberg <david@ixit.cz>


