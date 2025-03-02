Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EA2D12B93
	for <phone-devel@vger.kernel.org>; Sun,  2 Mar 2025 18:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740941531; cv=none; b=ouJYdfyCOfUGwFE9i+iVZFRhTNhAwyXCtL+td/2tLDNzQ1M2DMfqSLEj+FKduQEG4EeofQq25VPv20EVta6flGZvpd5DHG2vS23aUKV6GeNDMFlW2Sa8NLtCoplmycN+I9GwxxNr16MSwwHVLHM5p0Td9XIunY89lYC5sAeAqsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740941531; c=relaxed/simple;
	bh=2YMARwFzpT/2fxXckH/UHsQeqc+WpNlGXz87LpMaUd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ic2ow8jCqULQp1WDZEzWh+wBb+ol5LorB6+dh+F0kj2fUJ3BvNuYJaaZCAIFnEvW9RSHCAoO6TLiWl7VReGuyKmHtoGIq2/lpE7p+xAShSmZLEJcKHj39jdhYuEx/+9piDpq7K7d/xmY5wLO2oPqUr1SrhoVAg+sZN0ZbEo/ncg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org; spf=pass smtp.mailfrom=ieee.org; dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b=OdR0dY61; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="OdR0dY61"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3d2b3811513so14629045ab.1
        for <phone-devel@vger.kernel.org>; Sun, 02 Mar 2025 10:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1740941528; x=1741546328; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B7l7zFCEphXv5rcB1xTH7E9WWTKLPr1rVfyP4hQcYq8=;
        b=OdR0dY61TX5AJXZhlonjpCk1JIgVFFxqwClSDjuHlNrLbhwDKGADhJYbTUTb7sE1+5
         TsraLkBGn5nBVt2Ozn3J1q4LdUraaoQyd6t8+HTdGAhUkQ4ZuxmbQ2QHDVwsNHqX0EV2
         /cHB8KhgnalUvlDxl2W0aC9R5R91lKzZsy4yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740941528; x=1741546328;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B7l7zFCEphXv5rcB1xTH7E9WWTKLPr1rVfyP4hQcYq8=;
        b=qNN9IQE8CAjBe/SohMVPcWyzjNRb4D6hv2tN3jiIcZELbZonshdNORiFjeDzENRIw3
         ypEVa75UvIaWyI9ru5imlZTdAUWU8M1JZn36We+jR9aDWXXhfXJcHtwZKMv3KdoqUpI2
         bL7wO928Rm0Y7DI7xrLCqn5V2D2d1DgbrK8gw9GEpyyFY1YKeM5DnVeChnqkjMqlASnX
         eFgNNnYuHbg9OQUmO6zgTuKfQWA0fYhaGBYQbg/QOUc8NT97j2xTpCJIMhj25p94nnM9
         Vmm6JhLKxrQIDYIbqCf8d+GK5WSTLAUulty958MrzC/qCMiraKgPp4CqPEF7zdcq3J08
         Luyg==
X-Forwarded-Encrypted: i=1; AJvYcCXAeldf+vn+Lcpm3qAK+kMRDxzAZNK2dozzWoWzGQnFiJNUX774iGnRKvaF6Nt8WTVDU9724EOHYj1sig==@vger.kernel.org
X-Gm-Message-State: AOJu0YxanksmNCeho5lfuE4dvp/e7H5bqui1M2R2l90XL69PmpVLsSyl
	VfLKpV6a8mznpRtQSVubG+xx5Zu0izvjXpknhkTZ+fewPlh/QFerSYJwMoZI0g==
X-Gm-Gg: ASbGncvTkQ2mCL2g8b5h4hH2vi1SG2j07LlTybiOrdu/LM4RBG+8ZEvMc1Lm/jy2G0b
	6gkUIEeBcp/noTcG56Yq0dTw+N30ro4Y0c9Y0ONNq+WztPa9YXv2fePuqS3JNmefxeMblKt6nPO
	DQXI7aII91mkYGu6VTwENVTMu1IfhIZ0nTJLl5SPLQ0jNZgLEjnU/KALj8pWvjQiXItEYNPgq92
	w4BHaECCSZeHB8LOtmOTX7BvYlj4FhFpw37YEnp/TurDBu2vwjCAnmNew+S7Kp610Q0ldDSU/Aw
	3wecx4QeHOLm8o4jwfkRwkiKSR0vOOcbhwecmOumaHlxHO1ShG2riJK8tzVX5cfAFynrvP8Q9b2
	t6J9o+WPMHrxI
X-Google-Smtp-Source: AGHT+IGaYwptaiL4qcE0O0nJBy5S6QCvEaXlN2oaucVjj+jdPUcbQMj/htRswkhfxl61JYv1Owe54A==
X-Received: by 2002:a05:6e02:1d87:b0:3d3:f72c:8fd8 with SMTP id e9e14a558f8ab-3d3f72c907bmr39999795ab.6.1740941528462;
        Sun, 02 Mar 2025 10:52:08 -0800 (PST)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e9e14a558f8ab-3d3dee70df6sm20104735ab.36.2025.03.02.10.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 10:52:06 -0800 (PST)
Message-ID: <16588001-9fac-4508-87f8-026acfee8b34@ieee.org>
Date: Sun, 2 Mar 2025 12:52:04 -0600
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Fixes for IPA v4.7
To: Jakub Kicinski <kuba@kernel.org>, Alex Elder <elder@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 phone-devel@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250227-ipa-v4-7-fixes-v1-0-a88dd8249d8a@fairphone.com>
 <20250228145246.7b24987e@kernel.org>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20250228145246.7b24987e@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/28/25 4:52 PM, Jakub Kicinski wrote:
> On Thu, 27 Feb 2025 11:33:39 +0100 Luca Weiss wrote:
>> couldn't be tested much back then due to missing features in tqftpserv
>> which caused the modem to not enable correctly.
>>
>> Especially the last commit is important since it makes mobile data
>> actually functional on SoCs with IPA v4.7 like SM6350 - used on the
>> Fairphone 4. Before that, you'd get an IP address on the interface but
>> then e.g. ping never got any response back.
> 
> Hi Alex, would you be able to review this?

Yes I will.  Sorry, I've been sick this week.  I'm
feeling better now.

					-Alex
