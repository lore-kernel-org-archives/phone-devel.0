Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7404963A5
	for <phone-devel@vger.kernel.org>; Tue,  5 May 2026 21:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778018080; cv=none; b=ZC1DlNPuwdc+MlPfx9q2U0dgyNE7xhCmOwmmHuQsbtnj1p0SQv0wUwQq76LwrIztQ+Gm/VUi62lhgd0ShbHUlXM4jnF9pUJCpbfbbm2S1F9mMGrUJ3olbjib3Nv0okZI1D3jxPKUytMwAp16Rn7EwCFYTkHWDfQ7+e2J1Lzft+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778018080; c=relaxed/simple;
	bh=Z2huH/EQXujQCyF1M3eGhzyawOQuqd92ysZl/OTmGJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kBjj5Z+4rEywAsFZ9jtzXmYypFEN+jyf49Slyp3qPy3UtccPoNDtb8722xrKU2nHIMU9/F+2k/Po+0Ok36D4jNGf5Ej1sGkq9NvE4FG+E1uTMqoHCB7RcmlEanB8JNnCXSMfZ6Jv9UdkH19TtvGQxKBi/Kaj8Vpt+CugFYJ6n28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c/53vS+F; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c/53vS+F"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ef38cf04f0so5965003eec.1
        for <phone-devel@vger.kernel.org>; Tue, 05 May 2026 14:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778018078; x=1778622878; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=c/53vS+FeMcLQacVv+h31lhxPSmgVWLYmYQBYDZwgntoj7qetk3qnpz5cjCvXqbHiK
         rwkk3IQbWB/DJLvj5uvOQ+DS3cdYK2g4PpInEgIqwYYnQC2wfkxCjgWEGQN2qoxEDpit
         06u+7kMtPgoAzr1Y6UQWXYiZPGjmQeBALkrxTubNDKQn2nMLLfp0DFIcf5M5yWtS1r8/
         /1DraMhRP+9Mk9YpCrEWkAHDQ6VealkMENOo2W+hiOMeAl30BqioIDqlmm5JQxxYzDnq
         KtyKGCk0579DYyhRA2Bapvoqe1tXxYMsRMKxfOrWJziYwMXslRqsOXKpt8H23KqtEEhT
         o41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778018078; x=1778622878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qn2gN9TOXcgav3hEevfmLoUHUeCTTlNmOyy5YzrGBk4=;
        b=rSQgAci9Nk9pGR8YD7yVF6JZrBvk6Lwc7ssyflqx6pE/UaayuIuq0neoU3rb61pRhG
         QhC7R5XzCGF+AfluxgzaJtkJ3G6q9Ycii8rzITVHQEgmOFs4yuIs+rq6J6hUgwQ/ypQN
         cQOmfeT1dJrCpJlLQJXbQKtMWNZYqhRq/qcrYN5dqZ2hROu0zOTcc/x811MmcVXPKT8k
         Y0d8pWIITL7VBjyADeMHTkkz+yi2kZ31SZa5LJmHI9RGsiJ4d60H7KqwvdfYkAqQrNOi
         nYFbO0phgcmH/mytMONFQaLhGoSWeWWkpOtURYvp0iObE7wXB6izm5LmrGIZKFb6imPQ
         DegQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FyppKoQoHDUJhP/XwY1ZjJl5GMHoLe0hz9gTaD+GvXfhW5yCXYyiRmci/V1/afovjiUiabzq6c4Ragg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+jwD8sbKkSheaVSZ25NUCrTnOWj8eMdmZgj/vCuKfrhgKhCxP
	N6Nl9YVByRHfD/7y4rkNDG6rnIsVvOnI5n/vg0wNrzPfAzCE53KSCLl1
X-Gm-Gg: AeBDies2NzG0rU4Lu5ZgF1cUwBU8gTq8bMqBvQjHDZZvOp/azjbdwxUY63XcYXPgAzD
	DljO4XYw/lZBsHGg1cvbaazf8C9pGzoQ+ylGFPsbYH6TNxPiXdg6tlLZcG8jiAengs/Vgl6yC9G
	3YZYBb0basdi3xP/RuvBvrt3JlFMkH340mneNWjllbChmy8COVEBg9Xpv0yRQ0RV3MdbjnYhfLF
	x9hLJ3Hk/aFmxhxE2bggIucbrDLO2D8CdecNvUn8hAIJd7JmL0E+E8ulRQe66UdKqjbpZ64O3PS
	/9wyLJy2KmA35ZAqP5HKyqRg8rZjVpwbwZocidRwfNY1/qmaA+6od1W9+dLKbDcYAgNqDSnfJ3N
	5TNxXMWK7qKZy9ZCrkv/VLNvjLbiT3FfN/4aMqDCo0wYrZ9M5DkL3BKXs92TzbaLiD/ANKb8VvM
	M/M53BNuT9rq80cjLPTOqXVU4Mbp4Po/hUXzi7A3552fuBeGTBJqa/Ch5a0WRmyoID0UvNh9ooh
	70=
X-Received: by 2002:a05:693c:8110:b0:2d9:32c8:2b69 with SMTP id 5a478bee46e88-2f54a39074amr415753eec.28.1778018077853;
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:94ef:a6f3:2c96:2d58])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f56cec763fsm722870eec.4.2026.05.05.14.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:54:37 -0700 (PDT)
Date: Tue, 5 May 2026 14:54:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: david@ixit.cz
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Petr Hodina <petr.hodina@protonmail.com>, 
	linux-input@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	phone-devel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 00/11] Input: support for STM FTS5
Message-ID: <afpmQKJilpgDqrpJ@google.com>
References: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409-stmfts5-v4-0-64fe62027db5@ixit.cz>

On Thu, Apr 09, 2026 at 12:15:43AM +0200, David Heidelberg via B4 Relay wrote:
> Used on various phones. Minimal viable driver.
> 
> Includes device-tree enabling touchscreen on Pixel 3.
> 
> What is missing:
>  - switching between AP and SLPI mode (to be able to wake up phone by touch)
>  - firmware loading
>  - anything above basic touch
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>

Applied #1 through #8 (#5 with minor edits). 

Thanks.

-- 
Dmitry
