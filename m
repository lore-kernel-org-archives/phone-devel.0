Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4FA1946BC
	for <phone-devel@vger.kernel.org>; Mon, 17 Jun 2024 10:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621983; cv=none; b=HdPbFzGBmKLeMe7NE68N/JhhRVCuNITBzo94RtXs2vkH0Lob6WfZLLLKkIcq+hSlqgf0JO7UmetJqMQ18s7hB/m/hDmaySbDiSx3n8nala9kMPjyogmq63ZruiEIDyjNwo08XFpD5ChmO+1Hl2mxih+43oz0ewbQ+IuVuk1R2Rs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621983; c=relaxed/simple;
	bh=hn0Bf1NWM1oc7LXNFaCahn5mq4WgzQD19N141kIkogk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aFqO9T10+ktf92MeqkiuD/WTtyWPcjn2NSmEm0h46zb6sjseRSuGOteC6eywfhZK3lmN+Ql+g87zBetRvHiI+Zk8ZVAn5kOaB+4Kiwnry2XnlN2uFMFnjWxwk19OLIeTvLT3ue7tYdghVuS18YCGme/c7kodZN5qgykmNhWJLHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oH8wpgTI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oH8wpgTI"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52c8342af5eso4498897e87.3
        for <phone-devel@vger.kernel.org>; Mon, 17 Jun 2024 03:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718621980; x=1719226780; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pMWWdj8v3UJOtnq85Kv3lA2ksrhKp9Sh6LU/DO5R3WY=;
        b=oH8wpgTIm1A4ecQaBntZAx21mz/6NFG9rTaqgGyrWnq2Ge1YTw+bd5wyMGj1AqRw5u
         p8qSY8W53SsQorx0ozorHZhIb1LF7CN+3+ZtYVGLgYgdOXZ3MUgduCnSilixCrwc1ZB2
         LB2IumBeOuGk5bSCK3mhk/1bwXHTtH+owvEKpmzuRXUqi3F76FXQbR43L/lb9R3EOLqM
         5pTM04icMNZxpYBhRGEKwck30XhtKn+6+JDb2SiTqowW54NYIMfr7g7tBGf2IC7MGeJX
         u70JOereUxFKBWr3frK7jWomQFBIz5NoMVf/+AXTBp1y4aFG7tlE6L1AImerrrFReVeK
         cFAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718621980; x=1719226780;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pMWWdj8v3UJOtnq85Kv3lA2ksrhKp9Sh6LU/DO5R3WY=;
        b=wGD9CeoQAZXFZ18z9pvNjSNQnOiak8AvukTjB1FTpoW6+2OQkw4/tEa0DzWa+uhnTO
         dYgEhgYsO0ioUQ1ZFA+zcgTnNuu2O6MlxretoBY3PyW/1HBPaj/HCApmKxTr+dmOMHuS
         AymR3ztUOwnRCGs8LJ5Lpv4aI+7KjN2X4oku/zIFqF7OJyEa9VMIGk56b8wyUh6KA4fO
         kkRVHGxFvO/1Be5sY91PuFakIa3xeN3AzXVNGrEkDH2PrZ92u7UZeQqmiEQD816v3ja/
         7qmu+V9v4utCTvaxULYO5vVPTBsoVn8oDFFdkChZnZ7PzV7Djsz9sBmwuo3aGQ36TKkA
         6bXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaUH63bt57kbfAu2vyDvGEcvcCYfUTvzgN5riRk5F4mcCnqR2+1M/ysYDdHaIDWWIK/dSwXqJ+PIn4Fy5fJrSTgoqp6Fd3AVx8MiU=
X-Gm-Message-State: AOJu0Yzo6U4mHIartjeQaOhj4XKP9AUoEEmLwl6vwDmzaGcI7nlv4V9I
	nnwBQbE0Kqc77370e9q3sllyFZKHJ+4veDjc/qcsQS0EaZ51utuxhNbRRorhVrc=
X-Google-Smtp-Source: AGHT+IFqAzFY+0ttoTNIzHDFsWgde4oqakdrBhqn/iZoFRhF2FTpcHR1pQJNhRNN1sSyumZ2mhg2dA==
X-Received: by 2002:a05:6512:2345:b0:52c:6ff5:aecf with SMTP id 2adb3069b0e04-52ca6e8fe40mr7811655e87.42.1718621979723;
        Mon, 17 Jun 2024 03:59:39 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ca282f3e4sm1212268e87.93.2024.06.17.03.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jun 2024 03:59:39 -0700 (PDT)
Date: Mon, 17 Jun 2024 13:59:37 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Pavel Machek <pavel@ucw.cz>, 
	=?utf-8?B?QW5kcsOp?= Apitzsch <git@apitzsch.eu>, linux-leds@vger.kernel.org, phone-devel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	~postmarketos/upstreaming@lists.sr.ht, Bjorn Andersson <andersson@kernel.org>, 
	Christophe Jaillet <christophe.jaillet@wanadoo.fr>, Conor Dooley <conor+dt@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Kees Cook <kees@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Lee Jones <lee@kernel.org>, Trilok Soni <quic_tsoni@quicinc.com>, 
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [v4 2/3] leds: sy7802: Add support for Silergy SY7802 flash LED
 controller
Message-ID: <nxrodsfowjfn64dn6idoi56hzrhdszxylmw6kdhgxbt53akamf@aavvblj64syf>
References: <20240616-sy7802-v4-2-789994180e05@apitzsch.eu>
 <5701d3e7-f67b-4189-a5fd-8a992b9155fb@web.de>
 <ZnAHsRn3N4mwPL7q@duo.ucw.cz>
 <e9fd75aa-3bd8-4227-ac07-fc762e558ea6@web.de>
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e9fd75aa-3bd8-4227-ac07-fc762e558ea6@web.de>

On Mon, Jun 17, 2024 at 12:18:11PM GMT, Markus Elfring wrote:
> >> Would you become interested to apply a statement like “guard(mutex)(&chip->mutex);”?
> >> https://elixir.bootlin.com/linux/v6.10-rc3/source/include/linux/mutex.h#L196
> >
> > This does not look like real improvement for code this trivial.
> 
> Various source code places can be updated also according to referenced
> programming interfaces.
> https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/cleanup.h#L8
> 
> Will corresponding collateral evolution become better supported?

Plesae stop this. cleanup.h might be a nice thing, but it should not be
used to make code less obvious or worse.

-- 
With best wishes
Dmitry
