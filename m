Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E0C3FE667
	for <phone-devel@vger.kernel.org>; Fri,  5 Jun 2026 08:50:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780649418; cv=none; b=QUdoGb7sCjtBC6hJHaa3vIKg/qklVTBQMRQ6ynlAlXquP5u/tofqJMMF3mmb811QOYOnC/9F4qcusQDIgkpr6qa/waAfyzIVs6rC/XPFe1aXi6vxRBPpEbz3d0hwyE9QYYE5UCVGsY7VuRfVe9kA11/kryL+XD+v9+x4twWO7Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780649418; c=relaxed/simple;
	bh=oiRMhyrxK1V2pzVWG4kwnbDDdDHtak7KOQmTPXZkRPs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HQdCetXRa4PaC4Ue3WoFb9zFYCGJHJEtJcOrzhMxYCLF9nwq4GZ1mL1JiE256nzmMNOm6Fon8zlGS6vax0bL5Gu9mURTTwvU5mYpqP6/7rM77Zmos+pA5NCeFP6PJOJy2VZCC21e+jVXzcHdcOw/R5+ANLKt0+i+ajZVmwIAMqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eOegX9iR; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eOegX9iR"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68cc6c7df99so2318131a12.1
        for <phone-devel@vger.kernel.org>; Fri, 05 Jun 2026 01:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780649415; x=1781254215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZl60tcPzHqp6fX1KDjQJ9/5UBp9fAzatRkPhgk+Y04=;
        b=eOegX9iRXSYRza0VjOMOoGMs9D7De2Acg9J9qjTS8jA0cNET2ICEXXyeCiPfa9v2+t
         g5mvGd/cyDes0BB0+Vusj3uK1tb24BvO2TWiJRYIzbKbGl4YTRefWi67YvrFoNhAVWbi
         geU19o1fsC1+gLLP9PEe8LOx5RQF7qVr+npMcLRjKpFasrnqZrUzpehJTGMW6CdursSY
         6RHQqspG5i3KEqzB+3YRdjssH3vtQZHtdOkzQp0fnfdNtR3z1cGA9QK5Cg0s97dlw6n+
         POKnPa+GIbFBq6YT+jM9IXqfzLBTWK5/WnaPNpms9SSRKjoweiGvg2bmOSb8YKiC9NL+
         tEfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780649415; x=1781254215;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZl60tcPzHqp6fX1KDjQJ9/5UBp9fAzatRkPhgk+Y04=;
        b=r93lthqQU5ddNc1zEKl51YVcK/gWDVJSEVdP1gpAXPuhiYXNgZwt6SJJYnsHvVEb6N
         N2ueQj2R1k2qGKqoyaRguO3ljjRzaw2L5bo6RNTAW0N9bCabT7AypXW3wWAW4wEx6FLF
         MLM36MrJhGvwsHaCTKkw+H/sgENxVjUtPqATP0vsXt+GAlF5e97xKQp98mvdfGjzLJx0
         riag6P9W2xu2i5Hpav9qsYfDKNZNuWr8i8mnSo4fK/yWd2gx5ArrpR+dHQsRjyzskd/b
         NPl69TouVifPKIy/r6IVqjAcUvWrGZpfJOhoTyXydrLySrR/aRGdXzG69oV6W65Nlmh5
         96cQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IsErc8mBziSXnCEDwuzjaFu13/atxvboTqz4Z9f50WbnjIypl7OEw9ThwwVb6gp/fA4P4tkjTEAhdDw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxMZgIhe0zo08gI9/6gn/tMGKiD9xJnN/O4fbaHpoTob/ZpobQ0
	g8WfOhZoJhAbZSp2Um3SeAUV6JM3GSGNiq/0a9epDAwrxbFrQpD/wMjmzyYgzAD52a4=
X-Gm-Gg: Acq92OGnMZS7sM4zqhWNmU/LCzkrraMRIueZp1heN4WIBZzHEVwHHXTkjIDLkb3p3D2
	3SsjJDE8C6GylNGoGmrMfVDWcWMlN4XBZq4VZ61GGx1NPfz4AbrOePbWb2P/v7JddsqvIAW0nO9
	o9qFNwqWlYNx4yRfOaLHRdMD3Lh7Fynj2eztzYJ0NgK8zdoDivEnyPOGvO6QHkCVYW+rX/OXL3g
	euCoKb3OPwbqRRyuA/eJCRXFzo5FMGvhij0itReZ2ZNylO1qwBwC2UjiDF9IVEqgeZF8ERWuG9T
	KwsdspBLdWiE5YvyxFSSFdgGkA6gQbdk2GVKn47J7VQC6J/Xb5twhlNcnebjQefCc2c9nHvEaTI
	fzjL6B3A7pbnx09jiHhzo4BgmEFQTBSW4Ds5oS1sZ/on1sl4hoQB487ggWHoSuvAdURpL04vA0w
	TiQmQvYVGDqh3oc6NHBR89QSC+lhT3LffFrwxoQna9R2ZX/A==
X-Received: by 2002:a05:6402:4595:b0:67f:99d8:868 with SMTP id 4fb4d7f45d1cf-68fa5147360mr1211380a12.16.1780649415420;
        Fri, 05 Jun 2026 01:50:15 -0700 (PDT)
Received: from [192.168.0.101] ([109.76.11.158])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e67sm3320961a12.21.2026.06.05.01.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2026 01:50:15 -0700 (PDT)
Message-ID: <43395467-42e8-4737-ba5d-23e31b5518eb@linaro.org>
Date: Fri, 5 Jun 2026 09:50:13 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/8] media: qcom: camss: Prepare CSID for C-PHY support
To: Frank Li <Frank.li@nxp.com>, David Heidelberg <david@ixit.cz>
Cc: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
 Todor Tomov <todor.too@gmail.com>,
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
 <20260603-qcom-cphy-v6-3-e50de0b557a8@ixit.cz>
 <aiChDyKleAYuzjMg@lizhi-Precision-Tower-5810>
 <43b7da84-3390-4094-a61f-9e887660eb10@ixit.cz>
 <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <aiHM94-IDjiJWeqe@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/06/2026 20:07, Frank Li wrote:
>> -       bool cphy;
>> +       enum csid_phy_sel phy_sel;
>>   };
>>
>> Frank, Bryan, snds good?
> good for me
> 
> Frank

I think I've been fairly consistent in asking for this to be !bool so 
yeah, ACK.

---
bod
