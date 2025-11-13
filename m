Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A00727B359
	for <phone-devel@vger.kernel.org>; Thu, 13 Nov 2025 09:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763026082; cv=none; b=TornuD7IYReF7KHQZYGlxtoX6wutq831HLI2I90YO9pRrt5tUrOphmmX/E8s020N6iPIBvA3Jz8490qq4nW/MF5PguwU5curVPONUczRvXo9TUwK0IXpNi+eOM6XM7EsncfvsLonKborzdzmCvQY73XPsLcSy5wR1saSKWfjdxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763026082; c=relaxed/simple;
	bh=HMyGCJqQYh9ujkqmTBAdu4RGNFwSTELIZpj6aYBe4go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YZJitED35OyfCVwUjz+GjvjpIALyOnUsObJgHE55Xt7WP97WTPUAH3srMs5YysJrX7dZYkAEB2rC4SJJGUIKJ1WxhZxX/+Q/tYSKI3aI05a22nngayutO5AzoA8kjY9PXFmktWrf7FVVmLnIPqsm4ocNBO8qzHJ7LfymB/2vGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hU7cUOsA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hU7cUOsA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47774d3536dso4821345e9.0
        for <phone-devel@vger.kernel.org>; Thu, 13 Nov 2025 01:28:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763026079; x=1763630879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GUQ8rfJZk6stmc9Nrz3QsiJ1sN+nWeofSODQ5AvFLg0=;
        b=hU7cUOsAMH4e6B81GtNyfTRHKV4ib1Hv1JlOZ3xrNriVG+s67XNrQcyRSnZAl0vuX6
         nJt+9+lWMyoHna4b1KEtDnKlhFNfM3NUxfmehzGnO/vAzrE8Sv5Uh4N7cWb3PAlJhKVW
         XGW+G+cVgYexV3gbLvYCQVGfjv745ebCofeKhPvqTKPAEkKoLi7+w9srI2Yu86u6vIlD
         Zp6X1q5dNd9yO7l3Gr4aJO0kB03Wrfx77sq0NIZ64FcJhDJypM9byecx+nIsG+QUQn02
         nL2kxARBNUoZ89Wf0ARRcQSSyxybjSXU5PyAbXksc8zuk4IxFfWDhP7nOWqp8W+fkIvJ
         j/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763026079; x=1763630879;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GUQ8rfJZk6stmc9Nrz3QsiJ1sN+nWeofSODQ5AvFLg0=;
        b=G9ZKAj/FR+ltOnl1xJcEyMYSsw2RtVVaOkPOnVf0BGqQll78dWSiLayqZKcQlfLXae
         7HJP1i9I+jTxwhkjAgf1L51DheqN06KH6bteaqiHH65RNFHMz4clcntTpn6obACtpaJs
         PIELsuHgMx3VZvp3qfaDAqNJ7l+9fqwv0y7QqxszuxxwvmDVKy5uep2D7osuHjaRM/ZV
         qhp5UHCv1N0PYJ1vexnn5XQb0TWNpuK9Sn63nTwZKuhnji4K+REnMW0A/I3yW2ZScaCG
         ceSswS99Ap5s7VkD4mwRnFMsGUHhcaEtnmmuvZY+tOJAWLTwXh/oOA5txTIHIo+bf9do
         Gptw==
X-Forwarded-Encrypted: i=1; AJvYcCX0KuPZx48eiCbZDFNV6Tffdcxw+Cg6qjLcJ7aBoBsjWFdynDYlbSIzbPY+hiyCw+0102Lavpr7ITcsGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMZyezIqKhVJj3j9eLQ5WEeJ5QsruiGy7ucHHkgdQqW7Eo6gOu
	/z34KkhwttTDTFmmgr7+A8pnTxqqp5QoYD7FrGnRZQlRsDG7nkXAwJfnk14V7eoKGqU=
X-Gm-Gg: ASbGncupdTdcSsi5nAgDjRc0fZaRkHFBCCyosiUYnNEdB0o1bY7+SWs6EoXGNy6Npz9
	bWrvzBxbUsYrSriSWm4Q1/JeFs7Z91aoWvY0QGgcshA3SMJySv2dF5Wqrr2BZUVaPU8lmGq8aZq
	4BwkkN4/qf3aEBnCPUjRjVarD2iI8yf7Yx0x9WxakRRnoiOVdD6HT+RcWTpDDTQW8hvbOWbSjyH
	MaFfpRo3bmSP+PdUQrAv5qoJTN5XufKqxvDlFuqtyeesGKZySH9T4Amk86hWNoK2mYmTDd63DSD
	41WI/pE/sIWHjbeQyIL/FAfGocR3QTULyie0ShXH+tkSXAK1Wdb+LWgmIRzFTfwUEZ4GMBGVJdH
	EubfWcXj8RqSFJmN8TvThgAZ7Ukhpx4hGWCL8Ji3SMhGriSxndOTl43RLkOpuCVPf4KhByZDQR5
	ZGQn/6tZHcv0gf6cyF+StsUyudSu9pRT+lJEwoKm1RGhIQgdQtJjNm
X-Google-Smtp-Source: AGHT+IHw7L3XGmJDpxEV8oddbi9Yd4/43abEC2dbuAVSkqiGZ0o9fEeGz0V3OqaYUe1ZOfohrMWy9w==
X-Received: by 2002:a7b:c350:0:b0:45f:29eb:2148 with SMTP id 5b1f17b1804b1-4778ca11b6cmr8011965e9.7.1763026078746;
        Thu, 13 Nov 2025 01:27:58 -0800 (PST)
Received: from [192.168.0.21] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c850ca6sm23687815e9.6.2025.11.13.01.27.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:27:58 -0800 (PST)
Message-ID: <b1dc3644-8df0-4147-94ae-1cfed835b9a0@linaro.org>
Date: Thu, 13 Nov 2025 09:27:57 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/8] media: qcom: camss: csiphy: Introduce C-PHY
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 Casey Connolly <casey.connolly@linaro.org>, "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20251109-qcom-cphy-v1-0-165f7e79b0e1@ixit.cz>
 <20251109-qcom-cphy-v1-2-165f7e79b0e1@ixit.cz>
 <26bc458f-1db1-44e3-937a-f3ee7c1027be@linaro.org>
 <cf9fcb8e-b346-4589-910f-09bbcc58f9b7@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <cf9fcb8e-b346-4589-910f-09bbcc58f9b7@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/11/2025 16:15, David Heidelberg wrote:
>> Should be an integer from
>>
>> include/dt-bindings/phy/phy.h
>>
>> - PHY_TYPE_DPHY
>> - PHY_TYPE_CPHY
>>
>> this should be indicated in the dt and latched here.
> 
> Would it make sense to rather use the int from:
> 
> include/dt-bindings/media/video-interfaces.h
> 
>   - MEDIA_BUS_TYPE_CSI2_CPHY
>   - MEDIA_BUS_TYPE_CSI2_DPHY
>   - ...
> 
> ?
Maybe, but surely you need to get the mode of the PHY from DT ?

I'm fine with the MEDIA_BUS_TYPE but, I do think the logic must be DT 
driven.

---
bod
