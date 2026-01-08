Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7558D2FC874
	for <phone-devel@vger.kernel.org>; Thu,  8 Jan 2026 17:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767894191; cv=none; b=MPEvKb+uAMBzVPRpbXfPhVthiqfJaywg95kRq8OlVZwtCVzp+MsDP2RqOau0Wg48xwoQDS9UP5/x9Zolfzmbfb9gDmXkkSXv1tNIIZ2jipCsw+MOm9XRKBM+A0/L9/wz+m3LLnvfbo0oAt7e2FGmIjiJ1nLxUTRJY7EXXf8De74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767894191; c=relaxed/simple;
	bh=w7ZSAN/Y+fZ6/MtbEExWJz5lJQOnb14ySXsF8I9Osfw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ug/NLEbKDvRGQA5k37dy5swuPyyD45dlYTYVb7piIcxFOiGO35Cr6Ck5JmOCtZvjvb43aFIJUhUA47BwiuamB3hIvvex4ibT7n0SWfm5O4QpiEmZ9Vf1tErjFHIo+ZRjIM0WHNDEiRZUsNZtJxD14WU6j5ZxZyZ3sunzGTs6l98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JR/8C6pA; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JR/8C6pA"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34c2f335681so2136146a91.1
        for <phone-devel@vger.kernel.org>; Thu, 08 Jan 2026 09:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767894184; x=1768498984; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ub9GicRW5zf1Fn16vHImmfJM7EEnlmvXQmNKh5d5sE8=;
        b=JR/8C6pALZEZeStrOMB1/0tq+PStkq3Vhzmvk7OONWJvzqDJqSeHK0rRGmxbKo91ss
         aEkkg9ZDgc7rmjPtyiwl8VvrOaubqMSwp8S+dzK+7FZY7MHQEy2/NZJLVIvKLcozHJid
         pSTTE/QbxzTNs9Xr1KvjoQzE45f3hTkEmIhf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767894184; x=1768498984;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ub9GicRW5zf1Fn16vHImmfJM7EEnlmvXQmNKh5d5sE8=;
        b=VGOpPzqaOeBe/ecKj6ntVhyi4qXETIa0iZc1Yd6Ba7m23PFMauyVpI4n1S5jODoGls
         6PVFLJyrt8He+qFL5w+5PwvT9piPXY0g/plIKLcIlXpp4Vc6ZmOyhWQU7+weSKCwRQ4y
         Fjh7qF/kGH9yGBHlohqEZVBpYRWbIzcBdgFh+ZqSER+iRfWocLQoqf17bqP2oJ9yPqGz
         lkUGKkN7hljrtMqpth3ToeL885C5RLHGIRahHx4LvQ953+tGuG9hlE1Nl89Rb0aKfm1T
         cR3PF6OKfXxkQNWVa294N5qYs0roiwL6diB7UCt97vimr6zvi7z6NEiBpPfkQwcx7BTO
         SGXA==
X-Forwarded-Encrypted: i=1; AJvYcCVSvMyZcybMKhb5SOv81Hv9Uo1YnCPpmjpjD1/rkMGjTFSNenbLBrEbwYebl62rWHhR4GhB9CgzO5MunA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzviccdVIXfac7TLvZUEJP4UtnXenm6+4g3jzbAzu+F+6y7gCbo
	a2OBNB4cNUXGAAKsPVhj59vi528c211nnNL/GSbg2lQkmictFLZ6WuJqK2DMUjpQIlm35/SDZ4p
	cC8UQFo4SKXRGHBJh9i1iWpLEdaAMFXHJQ5cPivM2
X-Gm-Gg: AY/fxX7M1k8i6XrHYZ7eD7VV5ZIqv+czNX/EcgX1serAJmM5moEb828AY1zq5+/T39W
	vZX8n/4Q+VYFLG8jpp2P3xrF85WBtFUWhc4aKVKIsqsLUGw4QHdcVb0stcVQQTGe8rEwY6sZ78B
	f2603PPCxV8Ss7aWUOQWuPrD753LXIuTmzNOgi8hYBlqRgwk4DiXU3iChlw2+UkM/J71P4twKXF
	StPFA9oDFLcETV0748WhftNrzNGIuuktxAFMdZjrJOH+mang91fqLG363ht5DjQP/Bh+Q==
X-Google-Smtp-Source: AGHT+IFnflDpD9DOSJb767uDhY03EWGY2CQbTIwUTr8XvEYxOb6cEf6psQqByf0NHGdQJtdCwx+3qVqvPgTa6Q86JFg=
X-Received: by 2002:a17:90b:1c07:b0:32e:1b1c:f8b8 with SMTP id
 98e67ed59e1d1-34f68cdda94mr7303139a91.26.1767894183921; Thu, 08 Jan 2026
 09:43:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107-pixel-config-v3-0-02a25e3fdcfa@ixit.cz> <20260107-pixel-config-v3-1-02a25e3fdcfa@ixit.cz>
In-Reply-To: <20260107-pixel-config-v3-1-02a25e3fdcfa@ixit.cz>
From: Simon Glass <sjg@chromium.org>
Date: Thu, 8 Jan 2026 10:42:16 -0700
X-Gm-Features: AQt7F2ovEmzD0uC85jxDhHARbdqf6WsxbvEbD7S7MNPCQg88M6yWKIzUPWtNJAY
Message-ID: <CAFLszThwHMEb6A+=Rp4S5RNxh3-iUgkznSufKv1H2ne1E53ThQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] doc: board: qualcomm: document Pixel 3 / 3 XL support
To: david@ixit.cz
Cc: Sumit Garg <sumit.garg@kernel.org>, u-boot-qcom@groups.io, u-boot@lists.denx.de, 
	Petr Vorel <petr.vorel@gmail.com>, Casey Connolly <casey.connolly@linaro.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Tom Rini <trini@konsulko.com>, 
	Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <petr.hodina@protonmail.com>, 
	Matthew Croughan <matt@croughan.sh>, phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 7 Jan 2026 at 13:28, David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> U-Boot does work on Qualcomm 845-based Pixel 3 and 3 XL.
>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  doc/board/qualcomm/board.rst | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>

Reviewed-by: Simon Glass <simon.glass@canonical.com>
