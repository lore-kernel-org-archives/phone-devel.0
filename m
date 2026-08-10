Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0333B2FE3;
	Mon, 10 Aug 2026 09:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786355743; cv=none; b=cb+1MktCAthjkSx8wtxWmDmYgVCnt3rL0Y5GQsqLiO9pKAzFzIQuE+GH1pYSmtYzB0fbEHaN9j24dbudW5t7WGwpeRXfh2daTO+RFCD0ATIMrGMeA7o04ntSKwJ+dPyQ05AFtn+ucaqWLgV3Ay7JXUjlr7QUOc486zqUgeLiiqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786355743; c=relaxed/simple;
	bh=2WMyjEaVRWK9jzyFpbiOhg17MMA4q2ioAFM/71Fd02w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AKh+UuelDN9K5QlF5eQG4Cx80voDURrHaZe1uh/2G70T2knEWLwVqPJ0sP/n17GUPxW7oytimWopKBLqDJzFK7sYCtbHVIWj51fNKWivEZUqU8ixm3k6epEga8o6raK9cO5TlprBxXcq3I6obuRjINterwwckBZ/MnHC9kEgbYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bAEDhDV0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bAEDhDV0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 982E0C2BCF6;
	Mon, 10 Aug 2026 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786355742;
	bh=2WMyjEaVRWK9jzyFpbiOhg17MMA4q2ioAFM/71Fd02w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=bAEDhDV0o+EJhp8ewhRMzIjXhcZfhRTFPbhUeBRq3xnCVM2dwuevPGYiif3eL/d5N
	 xo+iShOm2mxtN+h+IfJr4R8LrDV1BuKi7oFJiaGQv38kcyV0x1wy5RGTS/6t/Fk7W2
	 YFpnJQ1nlYXj2loC3EKS4arw4Ix8fr56VRJG3jNC1RUNigQU6tynwDGH8Y8VCGbDMA
	 1vYqS+Urn+/KT+kRqTcZxsy+AURA322NmYpmtGQ9WAuQir6wlMx+WNiz1w1N0uCFju
	 3TOHcPmedKhhoIDQizgLDDHwo6VDhdT3XLiKaYHlBdjWraovFSHMN/C2nTYyhUCpi6
	 V0sbwpIgcE0Kw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70CBCC5AD7B;
	Mon, 10 Aug 2026 09:55:42 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v2 0/2] Pixel 3 display fixes
Date: Mon, 10 Aug 2026 11:55:36 +0200
Message-Id: <20260810-fix-blueline-panel-v2-0-9344dfdbc3f9@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NQQ6CMBBFr0Jm7ZhSEyquvIdh0ZapjCGFtEBQw
 t1tce/yJe+/v0GkwBThVmwQaOHIg08gTwXYTvsnIbeJQQpZiauo0fGKpp+pZ084ak89aieNsnW
 lnGwhDcdAyTqij+bHcTYvslMuZaPjOA3hfbwuZfb+HiwlCiTlLroyZEqn77zydLYfaPZ9/wLcj
 S7cxAAAAA==
X-Change-ID: 20260809-fix-blueline-panel-af2b7c967f2d
To: Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Vinod Koul <vkoul@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1084; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=2WMyjEaVRWK9jzyFpbiOhg17MMA4q2ioAFM/71Fd02w=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBqeaAcrio9jDiP0gaEDmcuCh6XUgMthbgEL81Ki
 3rJH0m1NtSJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCanmgHAAKCRBgAj/E00kg
 con2D/99ET7GvwS5+RNu56YgtPQ7tQKhvdLgx3uBSYOjlcI4zTJJjBXxUpKfp38icet2FoR4FbV
 tUjjnR5n/zkpEvnqNghH4VRwmzlgKfvnQPOc2PdPVh01kswsnqgTLGafVnN5FaC/29nL+sD1ctE
 FmQ8m5aH7P/BglugOiprm/XZcPg+e48mZpgct47ZyNVfyDIvuZJhRuflGAJRf5DLJFmEuZrGqxy
 Awj4VkfdGW6xtJGFXnN5w8RrYdQFdgj68sKYxZVTJyElIAaZfx59nnCRhITBYWkKo4ZD0Vm04XS
 IYFQl2yTaTxXa8TmCeNp5jOK9jrJaTT6D9RiSvwy0M1RqUgzMGjlqBUMqzUmO6lyZBWKrhmCUOB
 Ne42n5/mWQLbiWHxZMkuzDSxcF+HgeJ5ni3PKnxNsi+dvVhHExrhcmJOZPjBXSq64OMVOK0wNK7
 a/cjMhnnE09oTEDgWHzXP6yiBuyuPytTDYasSKZ6ac8dnJzg+i7Q0y7wfXztXIjhdkFY2/R/wfC
 iU+J4vf+C23na3J0SF1EFydgGAGua80ju2JkDKX6sb2wuxw95rwTUjd9thdUewqUM309Jt6KkFN
 6ZI7zHa3aCV9LdCq+deroLLyzvnZRe8twoI57pBjLJQMFWFquXjgGklJLOV//NwxEZc7nlN9DjD
 ttNeuuR78/n+hmw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
Reply-To: david@ixit.cz

Fix panel not recovering after unprepare and backlight intensity.

I extensively reproduced the vendor bootloader sequence, but after the
boot isn't possible to do the full initialization of the display (at
least on Pixel 3, and panel can't be found anywhere else).

The downstream, due to having attached touchscreen reusing same
supplies, never turns the panel off. Let's do the same.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v2:
- Unintended change 255 -> 256 for default brigtness. Drop it.
- Added R-bs.
- Link to v1: https://patch.msgid.link/20260809-fix-blueline-panel-v1-0-e7f3a6beb1fa@ixit.cz

---
David Heidelberg (2):
      drm/panel: lg-sw43408: do not assert reset across unprepare
      drm/panel: lg-sw43408: use the full DCS brightness range

 drivers/gpu/drm/panel/panel-lg-sw43408.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)
---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260809-fix-blueline-panel-af2b7c967f2d

Best regards,
--  
David Heidelberg <david@ixit.cz>


