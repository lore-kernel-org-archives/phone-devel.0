Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC370266A7;
	Wed, 19 Nov 2025 02:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763517615; cv=none; b=c9Fwe02/uzxHDud5US5O0juQ+ni/9tPEX7wSs8I5PkWVKJBY7P/I065gWH8/ByIifvZrYR6rolvnpUa+jNrepcDEJXPOzo5Bk0sCS7RIMevAOs1kBf8OVY11S6VTVjBAH/DKUdnyIuUWON40FWRGgJOJ9AXeq1snyedmNnB7bto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763517615; c=relaxed/simple;
	bh=+wyBW64IzNGcFzUyRIq3XdIAGkWKGaf05JXNZtza/v8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LetV+nNJXibh31E9hfrahvFumnSQ314q05/d0DdPxJAC+OiZqjGuLZR6HKP52X4nI0MtLfSMYJto/Eu1UAIP5mRF9DFt6gDcVF9JU7ehJTBgUGM78lSThejqbxHoaEczCiVWRKhJnIDZe9PORbhDvGn+ZwrLMaRSlzNp7IVhiXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kb/UXTSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kb/UXTSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E2E9C4CEFB;
	Wed, 19 Nov 2025 02:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763517614;
	bh=+wyBW64IzNGcFzUyRIq3XdIAGkWKGaf05JXNZtza/v8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kb/UXTSeMmyW3QHHULosUPUWmqxeQJz7cW5eLR/nyR2yPwFAmXrl7Te/dHy8IBwuh
	 ie9qj2dIQmVwC66HrrlVnLlcbCZwQU/qbv69RVxg1TxvHTSmz1bn48KpimDrgtaiKD
	 ZYknW1kPYRGWcx2TUcPwjJVHb4QOau7vu/U9qqHEpIR6eJop/Gsfy6kXKMwDml+UyI
	 4CoUbeifcy3BQfXVPWnAJJtZBtyyQHQrNALPAxFnsRUPd5mf88y2PjfOru5TkkOUo4
	 ySm+kRZJ+qO3fISJLYJOkzUx29FX+bw/q7uN+Vblr0vvsmmhg+2ur8Y05gSdNF1dD/
	 d5kKqmMq/Vg3w==
From: SeongJae Park <sj@kernel.org>
To: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	phone-devel@vger.kernel.org,
	David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v2] mm/vmalloc: warn only once when vmalloc detect invalid gfp flags
Date: Tue, 18 Nov 2025 18:00:09 -0800
Message-ID: <20251119020010.72911-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251118-only-one-vmalloc-v2-1-fe702aa68d8b@ixit.cz>
References: 
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 18 Nov 2025 12:37:16 +0100 David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org> wrote:

> From: David Heidelberg <david@ixit.cz>
> 
> Without WARN_ONCE, the logs get spammed immediately after the boot,
> on devices as OnePlus 6T (Snapdragon 845).
> 
> Fixes: 7179b2256315 ("mm/vmalloc: warn on invalid vmalloc gfp flags")
> Signed-off-by: David Heidelberg <david@ixit.cz>

Acked-by: SeongJae Park <sj@kernel.org>


Thanks,
SJ

[...]
