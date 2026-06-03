Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF174C901E
	for <phone-devel@vger.kernel.org>; Wed,  3 Jun 2026 21:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780523871; cv=none; b=UsoSxzeq5SJQYmb8Ofzeco+fag3/6fnPdKwQDlH4G5g/2b7JtmwqvUhazEUz/dTqh6lGuwFFEHuCMmI3du06Avd1QU73LmYrdS1KH64ZG4lSLSFOikW+pSo6Zw427pEY6BwCCSpT/XzSomqWv5JuHUDSn6JZM4U+3KNDek3BXEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780523871; c=relaxed/simple;
	bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HiqSMB9Ghbz035ykSBgUHVzcd3TE6H/koF1mH6/y0ZRDSg0T0iirQzT4HZ7UqaUT1JDtG+gAN7uj0G7Cu4Ohpt/YJvUHowq1r6E/ufjAlLIBQWXArZvNZn/1SrxF3b7Mo+lRS8ju47MKBvxd4eWpF4wEm0pD0EBF34Rqet1DMfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJx7vnNq; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJx7vnNq"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45fd464d51fso256f8f.3
        for <phone-devel@vger.kernel.org>; Wed, 03 Jun 2026 14:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780523865; x=1781128665; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
        b=IJx7vnNqQBzKZd/0rWN0eeOfdRyQZdvXWwHtEDISpCc6yxtYnAn9x7qbu7cgxpPPCt
         lTgP1PjeLCCMiy1NpAAL4arYtENDV7uGoSM20GN9LCGvSnMxzmOuzKT+YcPTCxfZynlZ
         YwdAVOKbGr4+e7XGrhCw68I/q4jFKyDE35ImjwPP2RCfKk1vKQtexfIao4JkAaIbBQN0
         i3OE1ST+rLg0Rieu0v0Dc6fjtqfuUf+FlIu9DSTs481297OPNWPfBZ58OChSYBgLCOti
         bWAHNZR3mhsAhu45X98Ds/HhGSnd5NilvN52MV0Nt2pqQ4ycCfZsOei94ccE5Al/rblg
         kEIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780523865; x=1781128665;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=crzKQndIwLbEeYCTsWS+DnJshKb+4YhCxWRvghP+llM=;
        b=MappE74bmfUPGckF9adeyz7sV0ZWIoU5Jc99RjYsMq/Oa9A5B2rVnp8mSBmq+L9k0t
         M8eHrGDkwGeUkhlcNkje4fT9JxSD+1d51CDIqH9vUlPNfimuoeLt0bsAzOob0H9EYeGw
         nFmOBMu/96diz/03Nt1GMQog0SrsDwKMheE6dFU/TNtc8UyzG2leQp3bG8fZQbQ7Z8I/
         M6u17NPl38LvdSU3kz8IrTCDVYw0Zy0UbCc6vl49p9Kgl0kaY6LB2BmNsGB3Crl/RiJ+
         8rLctATZeGwbAGNhdr5XTpMLf+fOSuQqUbLZrqG1aCv0UhccE9OIB5lDBpASmnULKavi
         sryQ==
X-Forwarded-Encrypted: i=1; AFNElJ+XNKzdSt3ySHve5tBKGF+3NX2G8FmiPXceVhM/c2ML44Gc1At0meuBl7LNrWMYfXJK92JLO1gDrcbxOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFJtbnD7vGthqH3ZPtxPfzw0u5QUROPln0JejI3AvVoCJ6xkNV
	xI2cjyfevAYWTldFJZe49Zrj5xMS7Bg3hhOucCWrQhsMWkR/SJL4v/gDsCtcg8jj1nc=
X-Gm-Gg: Acq92OHfPgbj+QzcNYZtJqx5OovUDa8y/C2WZfzuZDbkDAx3nY47McKpro+4HC8lcEu
	pjzFi+v/ZQTyZ4ZHdCEjHtCZ+SmXhETS3pzihT4tYqhvjyJzNdI2EjnYdVsKZgMHjTl7EujebST
	nVcLIyeparT3TH09WbN/jSFpnMkeEsNlD8TCcfunbpNsMzNgMb2eIWkwk4IACOPBUlEikMowzni
	NM8uHcJcVg1ezcGxPA7uaN6BMN3oUbp6JhTDq3+RO9zUpVNT82WBIpYvAaSSn/WzdgJqiXzBWZW
	7APpwnRpeebuqm5wFl4yVc5Sb/JmlIhUWJjliQ4k0DSCQSwADhRmiHeE7x5PPZYdnnhkoQtBT8J
	mpUe1blwtn/r2L5ZMvFzPyUj/hLD/IBV4K7Yc07Oi98KTtS011IJO4WJzkQlSqYTUBaLQojNfMH
	Rge5O3ZCRAmE21AZHlDozbNCJq8pTHYMeRFejRVme4qmQUhfgBU789+dzQ
X-Received: by 2002:adf:f642:0:b0:43f:e990:2f5d with SMTP id ffacd0b85a97d-46021876fbfmr5427191f8f.35.1780523864910;
        Wed, 03 Jun 2026 14:57:44 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.42.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2e4b18sm8068755f8f.10.2026.06.03.14.57.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2026 14:57:44 -0700 (PDT)
Message-ID: <958b2eda-8ab0-4eb5-9b43-d74c5872b160@linaro.org>
Date: Wed, 3 Jun 2026 22:57:43 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/8] media: qcom: camss: csiphy-3ph: Use odd bits for
 configuring C-PHY lanes
To: Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Petr Hodina <phodina@protonmail.com>,
 "Dr. Git" <drgitx@gmail.com>, Cory Keitz <ckeitz@amazon.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Kieran Bingham <kbingham@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 phone-devel@vger.kernel.org
References: <20260603-qcom-cphy-v6-0-e50de0b557a8@ixit.cz>
 <20260603-qcom-cphy-v6-2-e50de0b557a8@ixit.cz>
 <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aiCfzBAbEg27S85_@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03/06/2026 22:42, Frank Li wrote:
>> Reviewed-by: Bryan O'Donoghue<bryan.odonoghue@linaro.org>
>> Acked-by: Cory Keitz<ckeitz@amazon.com>
>> Reviewed-by: Bryan O'Donoghue<bod@kernel.org>
> Suppose two Bryan is the same person?

Like Dr Jekyll and Mr Hyde Frank ;)

---
bod
