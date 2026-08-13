Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AD41F365
	for <phone-devel@vger.kernel.org>; Thu, 13 Aug 2026 19:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786648437; cv=none; b=XgI7/dZ4OvAF/B8+80Jr15sEzUd9SCtkRHzp+NgEcpjF83BbcLnfurafpGvq4usQZbGJjO336PkH3v9/wdNs1sgZr0C7yN+8KEosQaW+7piaAP/DAMGdNyUWQTLIFMGU2B6d4mOBbVvZ2ym5AdgC0tMmunjyCpb7DfrM3G5x5bY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786648437; c=relaxed/simple;
	bh=594mSRa0tVsaaM0m4Zz05Ycb1HMWNqxXdGycPZ2r0sY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bZnNKL0iJyCa8V8KgdA89pk2Uz6zZCZ8yusmOQ06geryXu+j+LX+4SVVy+IyxYn3LXZ+6eosONg1Y9EJNjuhs5qw2qrZ7O9+j2dk4FcjkjTBK7oY83Glod57MsJDNDIm+F0J7C395NjMWl7ZXqJJcydZey9JTuGGs0ea0BTYteA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wg0iYbPB; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wg0iYbPB"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-381c51fde6bso231437a91.2
        for <phone-devel@vger.kernel.org>; Thu, 13 Aug 2026 12:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786648436; x=1787253236; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PAg7NeC1TQ8qjNCzW1dA2C5rHDBwRoUGLDkSbMYNfSM=;
        b=Wg0iYbPBLNaL9Gxhdzt56yAACXCfrxFJj5BKWb4+5AqaWx7CNqeq5tkqirNMIj6KUP
         v4U85YnoCF3XQiI5Ih1ZNpqli/ksV7UQMv07wDDvEZHuIQgzKCesRyEZqgD3pBYC1iUD
         20X1oKceiOIj1qajWy3YzNXbGu5JJo1JBHEi/efFli52Dad1Hg2hFgymXBYnuvkHDRcd
         GU0R0cErAJXsTBB6lfoMmYK6LBKputLXZYvpXn1c8816gsC28cfrzwBSHm3XMtNAEd+d
         t2uwN7gGaCeM46+SqjZNOviuu1QaqMeanQl+BKoTH7uMzx//R+gJt2wZcJ0+9l/34++I
         p+yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786648436; x=1787253236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PAg7NeC1TQ8qjNCzW1dA2C5rHDBwRoUGLDkSbMYNfSM=;
        b=CIKBfJq+3ha37NpBX341OkrBruFmg6aH0PvYaSjFp1JFCPYXXfVRct7feIfEQNN6up
         zro6VkhCdf1yJ/O14xV50oJcxeki464LtWwHeNzADepbYjuukuN2me9l0c+/jEii2L5S
         DfYq7+x3iztE2MEul5/U0ArO89P/jYc6KySfCcYUTpMd1kytPRoy6d+b5Qk0QP4ppMjA
         StO9ZiZDOJQNi76HUigsIhj1V/9o4GdbTf/mno4kI/t63Tu+yapTudcla3/Bg8eIBCQT
         WzcyMcSQ9LRp6XhfEfcDw3L8jvnVkCH/URQxXmBVWC4r2h0yS8SQI8SmIrhHADwrer/H
         cMOw==
X-Forwarded-Encrypted: i=1; AHgh+RqFB8xagkoad+BbaEUebRyvJ/aRsO8ZM+GeuYxLqn9DeVvtOjB2LeI9fqfumTcn/rZtjtKD96uuUe2n4Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwdELJt/5DPmGJmgePFhoUJ9kitkaWXE7HIZzWPuf23dOU0Oelj
	dMuNor/0JoUCoMbBAIVuwYflYwBTZfciwzDvkKYX0sOjAwnJNb9mVQJT
X-Gm-Gg: AR+sD11927Kl4lXN4p31ahXUFZBiLRG2Ek858afeaQelqElOTxFJWe0PH/drgBg9Na0
	2xxHnCdwwx2GsQpkrnX5T42PL0O0rJoJcIarV5wxBxnujMLu7MHn5qeFXVbPYOAxc0cfXvwHPze
	hdpq+DB+N9PNXnlxF+uXzjquxCGgo3OWx8HSHC5+WNXcGxVj5idKcHr9g1+0QCDsY3GApwrI81o
	n9Tbrzrd52dDKOpXHIlqjGgTmx4QA4SGoXtn0V72XKtY/UQ5Ao5BjBxZvn7Dl9CgRWjWENCbWFu
	ZmL4me8A7ekX0pnJCasQGF5gYFfNRctRN4iRLqyw4Cc1qucsCIosd+ggcAfAmpJGcc7c3gt6z+R
	UJylrtLBeRQPa1DbnhYOT28U3UhvDwj3GYKwF87ZYJcaAsunPUk6IYBjYeKdbm7IVa5HNK/zMAJ
	WcRyfMqu5TxE9xJilSjAq1llCJXA/mfFgr2AG8M/f3DK2BJWlzKkDUVB3A6rxe+4mExJvXBmnvu
	/6gwJtYk5B84+EEB769hat2YcABOA==
X-Received: by 2002:a17:90b:5805:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3933b90d562mr184091a91.16.1786648435953;
        Thu, 13 Aug 2026 12:13:55 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:85b8:2741:2d36:4d32])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebfc39de5sm9873538eec.22.2026.08.13.12.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 12:13:55 -0700 (PDT)
Date: Thu, 13 Aug 2026 12:13:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	phone-devel@vger.kernel.org
Subject: Re: [PATCH v2] Input: rmi4 - Use platform data instead of query,
 when available
Message-ID: <an4Xafaue2u4QT4Y@google.com>
References: <20260806-respect-x-y-mm-v2-1-e0681ed3d63c@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806-respect-x-y-mm-v2-1-e0681ed3d63c@ixit.cz>

On Thu, Aug 06, 2026 at 07:17:46PM +0200, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Platform data may define touchscreen-x-mm and touchscreen-y-mm, but
> these were quietly overridden by data provided by sensor.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied, thank you.

-- 
Dmitry
