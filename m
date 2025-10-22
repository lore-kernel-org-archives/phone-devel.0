Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2923E2F39A5
	for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 07:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761116416; cv=none; b=Lvb/tfyB0v0yN5ijLru9qVhozipP6w4khSXKMETJMe651O+sGWL1fBA9Gv9f7NbO5YWLOhO2L+F91qmvFgmH55AHLlU3nEvCi2WVtR4CkA9r52Lx8sFs7wAxTHh7ejarvoraCygdYKsAa+fPJjAa8ryLuPzTPLUKvWWEdRuzVq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761116416; c=relaxed/simple;
	bh=2ovcfzW0TZxfflXJ1CWAc3hKGj0ELxUHga64V8M6ot4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VIuWvvuC+a28EMPj4QJ7Mp28Q8M2UVSG3nrKHwSjypb5JPFvwMnwx9/Y6wbzntfJpx8fnDcNUoUKlHR1Gz12RURp/EoY/DN1FRgVuBB/+N8xNwFq8w94DLs78P4mjFWuMB3E++6CZWqdEj7EgzxkFcc+k0sJvK5Potv+2YvcZF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org; spf=pass smtp.mailfrom=me.ssier.org; dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b=lOKW89gt; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=me.ssier.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=me-ssier-org.20230601.gappssmtp.com header.i=@me-ssier-org.20230601.gappssmtp.com header.b="lOKW89gt"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-891208f6185so658466885a.1
        for <phone-devel@vger.kernel.org>; Wed, 22 Oct 2025 00:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=me-ssier-org.20230601.gappssmtp.com; s=20230601; t=1761116413; x=1761721213; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=;
        b=lOKW89gtGbwipcluEaEJlQSRPk4HOVPDoeTtBsPgzX4VBK4WR0IppUMuRypIaDitkE
         zYz+C3PQ0ZOjl4CeieIT7XgNO90JKwkkn44aUQAlXM/ugqZ0qflvyOYA+LEJPaIYfsSC
         orcFnv0bhf7u6vAlHN6ySJjTQvffohW85jgxpvVcq6zvEiGZRyEguUA3hZfa2GISSJVK
         pmn51Aiu0yGX6Ysj64T7ntOim463s8mqk48IwzDjoEqb5KiRgNRKph7RT6Bm/+LBD2/M
         RFjFlfVMkTNon2LMLAoCc5pSrzXLUZMNff/J9Q+YCciS8hDfv6WCvV1zhvL7EuKNUIoj
         /eaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761116413; x=1761721213;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UZ0zLiQMjHfWfIrETWEpgf86vfPQWqa3rEBNo24tR5I=;
        b=Hl5NXxj6RkFFRXk2hAn60bBCmHD+wu8x2nD2Uoy5dFwEYKbsy3oY2MuvYaomGoNF8C
         mKYAoRx7BWTVrBo4Icm2AJX5nLrQoGSvwQK3oFEM/H0kGtgz/rbPBWxK/e2HuaGN22Ml
         u2Dke433rZwzPaqqy0jovPYnXTOz/dOKRhlv1WT9hn6NL1VBVTjTyQW4LQjAzy3gVohj
         307JJiWqb50SRYxLFd6LUflJpyc14H9yCo5ebUTYa1DuY+35KMhVDxSWHozSPezzO/Xe
         LUA8heXXcj3cD0CM6NG7S4eCCvMtZ7bwZPxbHvvrWXgOodFYWABFCZdq25iGyQUUI4Z5
         CJSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJYcVQXfydVFMivaXr7U6rdGgFZHcfbjRYx27R6OBiVgcklrQTOd/tMTocatjQrs8/qyPPtUK9ruCK0A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTc543dpjzSCMr3CkW94hHbPNfe/pSASdco3i8+rGOhHb7A8u1
	3rOVXZCNg8VEP7hPVNZejSAV8BomqECFhOf5Vh6AQJ6Z5VRuObeE/iC1sO5vHBynG9Y=
X-Gm-Gg: ASbGncuJ+Ow39Hp3GelIFnBDBrT8uRXABeMS2mT1BUc0agLGyqmO9DpI1HMm+uic+v9
	xfK0aswXvCkc0XIsVvjCIGo6T7yj3dsrc6W70x9wWURKjez4HB0dVKOhWnAE6mPO1pI77EiA3n/
	Onoi7khUFugw20DQreo4z1/n7GAlcJ9tvmWxULoXA/DuTyAFKUvP4tU8ozYo0zRCwge9ovYJwvr
	asVCsOTz9mal1agL3gy9eg95iz2Lk174r/DuQmAuOUOqKk9J/bs2IjCpy4Zdx3LTMWynCmRYvFX
	FbK2xdGTM77kGCrAd5rZ/wffnf98qvgy1ZNRYr52448TXRhjQmPND6JrQ36hJp5w3oYu/zTTK6h
	Tf8V8LjoX1g21P1dlKDZu9fkertcb+2rLAPBzjjLYLpbBd3PcFMzl7U8VGX2CfJAXE+cXCALctJ
	T+oTw5nVAFCA==
X-Google-Smtp-Source: AGHT+IFP1Egld4e4M3O9ldes+hPt4it1nCGP1bODqWck6WjBakPWZGeujTTjHQoGUKEqPL4vEcQSIw==
X-Received: by 2002:a05:620a:4621:b0:88f:228c:c6a0 with SMTP id af79cd13be357-8906e8af048mr2096261085a.24.1761116412834;
        Wed, 22 Oct 2025 00:00:12 -0700 (PDT)
Received: from [192.168.2.8] ([74.14.126.215])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cd6717desm915892985a.26.2025.10.22.00.00.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Oct 2025 00:00:12 -0700 (PDT)
Message-ID: <77efe2a2-ee81-4096-9145-a76e35954e84@me.ssier.org>
Date: Wed, 22 Oct 2025 03:00:01 -0400
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
 <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Content-Language: en-US
From: Alexandre Messier <alex@me.ssier.org>
In-Reply-To: <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025-10-20 08:02, Konrad Dybcio wrote:
> On 10/12/25 8:03 AM, Alexandre Messier wrote:
>> On 2025-10-07 06:03, Konrad Dybcio wrote:
>>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>>> From: Alexandre Messier <alex@me.ssier.org>
>>>>
>>>> Add support for the notification LEDs on the HTC One M8.
>>>>
>>>> Two LEDs are available, one amber and one green.
>>>
>>> Do they form a single notification led, or are they supposed
>>> to act separately?
>>
>> Good point, I had to check the phone user manual to confirm. Indeed, it is
>> referred to as a one logical notification LED. It also mentions the color can
>> be either green or orange, it does not mention using the combined color of
>> the two LEDs.
>>
>> So I would say they are supposed to act separately.
>>
>> Hope this answers your question, and let me know if more details are needed.
>>
>> BTW: I will be sending a V2 to update the color name, since the user
>> manual says the color is orange, not amber.
> 
> Let's describe it as a single LED then:
> 
> multi-led {
>         color = <LED_COLOR_ID_MULTI>; // notice it's not RGB
>         function = LED_FUNCTION_STATUS;
> 
>         #address-cells = <1>;
>         #size-cells = <0>;
> 
>         led@6 {
>                 reg = <6>;
>                 color = <LED_COLOR_ID_GREEN>;
>         };
> 
>         led@7 {
>                 reg = <7>;
>                 color = <LED_COLOR_ID_ORANGE>;
>         };
> };

Using multi-led is fine for me.

But currently, the "qcom-lpg" driver doesn't support LED_COLOR_ID_MULTI, only
LED_COLOR_ID_RGB. Adding support for LED_COLOR_ID_MULTI is trivial, I tested it
and it works.

Or I can also use the "leds-group-multicolor" driver, using the two individual
LEDs. I also tested this method and it works.

> 
> + Pavel the LED maintainer, please take a look if you think it makes sense

If Pavel agrees using multi-led makes sense, I think the first option is the
best. I will separate the LED patch into a new series, along with the change to
the qcom-lpg driver to support LED_COLOR_ID_MULTI.

Thanks
Alex

> 
> Konrad

