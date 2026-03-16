Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52A243EE1CF
	for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 20:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773692459; cv=none; b=cgJUxgyW2kLu57kELaBgTTy5wlUWsPrzBcrbxVJgIk+7eBZXZz9zR4rr3RKYr4Et/JgLdOOwGH6Y+OZjhofdS2orhMSjGhXsAtuESkBP3dRsPuwfrIrbobWK5KxruGBej696DDiBZcTn4tVABtjbhmqGRvVxJuAjlxfDjNzuT4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773692459; c=relaxed/simple;
	bh=J9Uib640/uZ9Y68E+/FhFk+s+Wvkj5et2AsL214hxDU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CYxscZ2wIxlpPAFR4iFijJLD862rq7mnGg61t2xxGzaDvjAJiiCOLt+h40V8NuyKIdaH9DT1axVWtYwxwgMiDik4QKUGQSRP4SRc+hbqgw89erlI28K/8B0ZIfxU7x70f8m3CEXTLLx5w5cK7vGFO97STkF1T+9h3Kx1DVSUSbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsHuI44q; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsHuI44q"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b8d7f22d405so641173366b.0
        for <phone-devel@vger.kernel.org>; Mon, 16 Mar 2026 13:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773692457; x=1774297257; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EK50oCppLfVEmX9UiOHb2vRevLeFvTSXkedS8zq8Z8U=;
        b=EsHuI44qWZrFuDBdX08ldG+47qQx6FiwWYAvCk3kGRxKX3pr9hqskPAIfc5xwdHbjF
         39r6JUidgSpKf9ErN4an3ihn2WP4EpU4PG9BVM+o5A0zpyANr7esG2V0FGiwFQPVpuZd
         H5nD+H+jia/P0QfNZ83DnuFa0R5qGE6HSabfoMNCgDrszvu5baZRIiwbJHGZduxAL6RY
         W7s7Sg6VMm5GZg+1R0lx8CBBkYFQFOpS8KQSpOP/I4Qx49BZxXob3g064prr6x/OhNv6
         Dbpp2NSh2ZadaayEoBzBxP34REJADe8OCq/89K3AJf8/AeX2jKIHxvBIEXmlmenNeJwR
         GP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773692457; x=1774297257;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EK50oCppLfVEmX9UiOHb2vRevLeFvTSXkedS8zq8Z8U=;
        b=mQbtWTR3wQALDzM8cQjkJW/5Vi8kHOdY0sKHoTgkcjys9kZdmv68UOg2Msj6Y3h1fl
         M0EbygzcFdbbeTxNknOI9b8hs3naWiQDgEEXVINcX2kvtYIY+zknpCNueSrpSVxHabvp
         JZ8Kid21VDB8YiIK+RGk/QTUIThb8nUoPtQB35MLzf2QUDoycq6sKpvrZV2Gr3iE0evP
         yV1hKcLrvrDYMNMdIxBH9LWx+Cu9XD5Fu5biMVhdV1PTGFkowp+M8qjY6Q7yYwChAaHy
         dmpkj4k0G4ehaAlefWqai8+tjPYMwZGP1jH+7/KvxHD42eROX8YNJPYcFrqZeQY2IVp4
         W8GA==
X-Forwarded-Encrypted: i=1; AJvYcCWzubzdsg2M0Vtozi+WTzFNp5IUC3VUIU14HIRNRfZeEnzNlgH9oaj1i7dDp8FNOyaKU2nPoyJvDJejlg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMhPb4q5UIisoRP50Wy/kw8X0nVqSB2zB4xwSLszmkEHiikOod
	J7D6lUpj2cWXvCVCLm7Qq0CZq4paIsakkzenXp/Dlw5Mn2We0T1PuFbH
X-Gm-Gg: ATEYQzyfuXipBh0NQcEmBSqOuZGjDgN41FBSvUA6hhmuHDcWef5J4eTMa4KTN63eTCd
	L94+Y44TIkF8KvwdfClcCOApppn6gRwiMAE9HhbeodRILWLFK/Pe5RZiISpJLMEwa2VHi5lfZgi
	Sr3HCGO+nuN1Mx98Iz0+rf0vAXlRwrepEqawr7l9HDE8Ws2UQteP1vCeuW3U5ifxhiopLhMCrbS
	zc6e0YnvQIs2/cQw1ulwV8+VI+qp5IVp8G0H1lGrGDKZVbq538oQVB8wd8sPIy4IDwGRI27bZEX
	88TUthaBW0TiDK9zsih6HsC65Kv6dvyfYfq7ttGAm9sOb7pASGRIPmEy9MfYuLVAMPOMNJnP2yM
	4R8ix/jmyvWWjHnFL1+s2HG72JDURfi/2aSDCJQci5BgCTrmEloRrwuUEv3Mx752Qr/mackSTK1
	MG3NnF1dAE1iVejaX9tdR4HZ7qaA==
X-Received: by 2002:a17:906:c3a3:b0:b94:1fb3:155d with SMTP id a640c23a62f3a-b97653d1dcemr552544566b.53.1773692456428;
        Mon, 16 Mar 2026 13:20:56 -0700 (PDT)
Received: from [192.168.0.39] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97cb0d2e1esm127505666b.55.2026.03.16.13.20.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 13:20:56 -0700 (PDT)
Message-ID: <ea623eb6-2f63-459d-a1c0-afffd2428426@gmail.com>
Date: Mon, 16 Mar 2026 22:20:54 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/7] iio: light: vcnl4000: add regulator support
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Peter Meerwald <pmeerw@pmeerw.net>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Raymond Hackley <raymondhackley@protonmail.com>
References: <20260316-vcnl4000-regulators-v4-0-854fc2eaf54b@gmail.com>
 <abhhPnvQwpZozHPe@ashevche-desk.local>
Content-Language: en-US
From: Erikas Bitovtas <xerikasxx@gmail.com>
In-Reply-To: <abhhPnvQwpZozHPe@ashevche-desk.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/16/26 9:59 PM, Andy Shevchenko wrote:
> On Mon, Mar 16, 2026 at 07:19:44PM +0200, Erikas Bitovtas wrote:
>> This patch series introduces support for voltage supply, I2C and cathode
>> regulators. This fixes an issue where if a regulator is shared between
>> the proximity sensor and some other device, and the other device is
>> powered off, the proximity sensor would be powered off as well.
>>
>> One of the commits includes a Reported-by: tag without a Closes: tag -
>> the report was done outside of LKML.
> 
> You mean outside of public web access?
> 

The report was done in a Matrix channel. I could provide the link to the
report for the Closes: tag, but it requires to sign-in to view it.
