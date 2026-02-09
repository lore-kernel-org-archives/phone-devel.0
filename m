Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DC72D7DED
	for <phone-devel@vger.kernel.org>; Mon,  9 Feb 2026 18:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770661213; cv=none; b=bgIRcOasLe/fb87RH0ehP8hmY1vRrxwg4zF8jFpR3zDLnSw3L+5ifgNZXpb5dGD+goG6I6qbVzoT1S79kc+h2mHomZnYlXMsmhbWhA7sQyHjkpvVWBP5Bzdzar6EmQ+TMGjCA9sqWJcOi1oxIYVoSItgZpzUgMnEUvaDDOZBH5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770661213; c=relaxed/simple;
	bh=/Z5yt2oWOmU2bfIIiNcrfDmA9qc3h8e+hqkPxC3U1HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4o1mcefm/GHjw0mgsXQorc+i9LqzrueGYlaw5/hPN0UEvtBZRsQ953Ve49cBwNoZwvgSB2QreI4w9pd0/gvX0C2UYARErk4HzCxXV8wMXFwjVmoBGrSLSN+rwyLz3fg6wM8uuOJ3K49YtaEUnM6/Srl283RzNpw4yCqSXPKw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lgl5AE0d; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lgl5AE0d"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-7963af509f0so17925417b3.2
        for <phone-devel@vger.kernel.org>; Mon, 09 Feb 2026 10:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770661213; x=1771266013; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FGFByPnEFRf0LM/uYZGp1EI046vvWPTETytQcURquF0=;
        b=Lgl5AE0dK/pmu+tRGL/wSPK6dGdzc6bb/poFAFlYGS+ljwgD8DAxhnFEUJp5rSVUfH
         ycH4H5EiBn5BbHTHhP/AGrCn2oO0JfjaXpcw9LVt2/HTB6mSHXy5rKXV/EEegx50P2mI
         n94JrirOKC+/bD75svYgwcWX3fPMkNDhtDnlojLUb1FZlJyc6FYL00MJlgoeRjd2dFpB
         GVcJvlOPDoep56rezbcb//dQ9vYGh3UNSv26yxedW1OqIOQmgJUE/IKvKfnf6gBMwZs5
         G4k4cNhN4RgLWLEKHSaUlYYq/vGo8G7vIj//X7JUig0nGpq02Z7KyqsYJPr8t2RLXY7f
         rjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770661213; x=1771266013;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FGFByPnEFRf0LM/uYZGp1EI046vvWPTETytQcURquF0=;
        b=bgDD9Pw1YKiMMsAbByyCR4oIvHyrtHn5m+UqEGbFG8I5WqLIaVDCnk3IdIc8amXT0t
         4t5gfwYnoL5WkfvdEKkmk3zpqo3q/qPc+9B09PaWsQZEnZCEb9GAgIyLalgqGhCTu+/V
         qg//54Ku4zao2Om7FgheyCn16pMOs8akb7r37VH3ukg8M8cOu9ioPCTSn+1IHW3rtgr9
         Ve3LBQh9ijJAZlRf94JBa1PXy5IJ4x75irWx2gdVFhMy6YOlXH4DSUBvlTXdJb8RjlKz
         rt2PErsNDM6moiTq6oFWs0YZNwzIkxe11hLdtzj4p+4KvqqAD8vKoJaBNu6znDHi1BqL
         CawA==
X-Forwarded-Encrypted: i=1; AJvYcCUvliPGprx0/PjxW1/1n6R6usrBNEduFXmu+ub9MKxB9e+E5xCdfd55PWGtjXPaX3Eh5potdHRMdPwZPg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNXWfUGLzgI44rVAUhYYIVy62CjvMcQrAIdB5b68InSaHtF1jN
	OMsEMDoegKENt3MZY9bAQdtcyTZg1XpDXThQVEO7z+9K9cpajNh96Qow
X-Gm-Gg: AZuq6aK48ZYeFTlxGCZ22qWFVYqF1F9IoZmpcCERwGFtUSYOz8vtCIXSAiLONKY/Qgq
	90Ci9umNrOSXZDOzGjhc5SieCsDSgLHg/6wtniFXSgHWe050VfevXoekvdDirqEJxcNlPB4qzFH
	MesXN6NIltYtZIUyh9gEbc5I8D1BDl4XHQhA1Kyh8mCSHszxerlw5gzlw2FycfAOlFCxmUn3XUB
	zywtbkpldEDlSZ2VFs9IOoGC2Uyn4F+P++auwGVL9OUHxwJ4zaAVj10bOaMBwlFZxU5QPgdw59X
	iteP+2eUIaYhTWU5A/Hks78u/HyFQWx4nRtBQmXpmNPV73w435WsQqUFHTBcJb8fkZB/g5eaANu
	WdB1HpGzWGWnx0ASX/LFjVGodoFgdPYN5nE5O69LHvIqAPiurIDH7riMDOHvdliq63qvelUL2IP
	u7v+gJbfwMJ+NC9mpaeEqVTANv
X-Received: by 2002:a05:690c:6c06:b0:796:5974:2a19 with SMTP id 00721157ae682-79659742b7cmr12456307b3.8.1770661212669;
        Mon, 09 Feb 2026 10:20:12 -0800 (PST)
Received: from [192.168.0.40] ([79.133.247.80])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7965705d5a1sm12602447b3.46.2026.02.09.10.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 10:20:12 -0800 (PST)
Message-ID: <73ec81de-86f8-477c-a5ca-aae83528dfab@gmail.com>
Date: Mon, 9 Feb 2026 20:20:07 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] iio: light: Add support for Capella cm36686 and
 cm36672p sensors
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner
 <dlechner@baylibre.com>, =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Kevin Tsai <ktsai@capellamicro.com>,
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org
References: <20260209-cm36686-v2-0-a48126d2b124@gmail.com>
 <aYoBwFW4ZDFhmlvy@smile.fi.intel.com> <aYoCJMlaaPO8auIm@smile.fi.intel.com>
From: Erikas Bitovtas <xerikasxx@gmail.com>
Content-Language: en-US
In-Reply-To: <aYoCJMlaaPO8auIm@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 2/9/26 5:49 PM, Andy Shevchenko wrote:
> On Mon, Feb 09, 2026 at 05:48:22PM +0200, Andy Shevchenko wrote:
>> On Mon, Feb 09, 2026 at 04:23:40PM +0200, Erikas Bitovtas wrote:
>>> This patch series adds support for Capella cm36686 and cm36672p ambient
>>> light and proximity sensors.
>>>
>>> Capella cm36686 is a combined ambient light and proximity sensor with
>>> adjustable integration time, interrupt and hysteresis support. It has
>>> the slave address of 0x60. cm36672p is fully compatible with cm36686,
>>> except that it is a proximity-only sensor.
>>
>> So, can we share the code (assuming there is a driver and it already
>> uses or may be converted to regmap APIs)?
> 
> Ah, it's being added with the same driver... So, have you checked if there is
> any similar HW with the available driver in upstream?
> 

I checked only for other Capella sensors, I forgot that Vishay acquired Capella
Microsystems. Now that I checked, vcnl4040 uses the same registers and regfields
as cm36686 and can be used instead...
I am sorry for wasting your time. Should I add a fallback to vcnl4040's
devicetree schema and add cm36672p support by excluding the light channels instead?
