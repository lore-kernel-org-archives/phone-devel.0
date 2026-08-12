Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0387043934B
	for <phone-devel@vger.kernel.org>; Wed, 12 Aug 2026 11:52:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786535571; cv=none; b=U5fO0zGsyWOjdRj2gncRVvscGDt4x5s1Qex6aDCtOugI5rJXBeZDSfkv7QVKWXXfF8UEOi06FpLaDMCRxdeIVcRns2ySewi45aUn2C7eXKyXiRYHpkUFtMtm4tl9T+3pIXzzx1hSgxt+51bBA8aeFPw9450LemBKeM5s7JEgGw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786535571; c=relaxed/simple;
	bh=OWi/1VVq3ptM1gRr5+NajLFbIv98jFNSkf0y0944f3o=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=PtmjbNcZoKnwHhiHyms2Qf9ICB/w/clqKt2gCUL4YrGbMNXpPHPGrczuwrgkeU03ZqIPHK8ZtDTzWpS9FoD5OhHOb1Qp3pH0u+vXvzuh8aI6nj8iKGdpILsVH9qutoTbQnfEzycTF5d2nXy+Z1RRFbnjdv3ys13P+bNR8I0+qtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YSPO8Weh; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YSPO8Weh"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-495437bb891so7808145e9.1
        for <phone-devel@vger.kernel.org>; Wed, 12 Aug 2026 04:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1786535565; x=1787140365; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mryJFKNp9U/j2vl+1/90AHsRvVjI17dKCWsj626BK1E=;
        b=YSPO8WehVIs2GOJNeYOA8kgAQptAX7r3IongfAJ459xuqHOu1Ls0WRmD/8bVc8AndZ
         svOWodn01G3MUjO1zbpHSf8s9XWz57rS7J7gPF/DkeAD3mp6QzjW4tTESKVLdM4yLBJz
         csY6NAAqD5GG82Ya5jBhnaLwlyPSKhBfymZzHWixO0n1tbF86YC2xtS71RBbpj8SQ3u1
         dkG2fHjRXmViXKtVN4/7kYbkcfHRbSsdN84ixs1c71bDqjraCG1aF+UvznFJQZKRLixu
         IlmbRxfKfdbuFPr7BAoDWiUrx9+pfrQ6DuP6dIRVQqQZJc4ThcP6fw+cTq9WZ2awxbOl
         bKfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786535565; x=1787140365;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mryJFKNp9U/j2vl+1/90AHsRvVjI17dKCWsj626BK1E=;
        b=JjWw9YGwNMx3c9BgdGl2FpeFw+BovaCs8yAGovvcuB9HmvTuQccxmrS3dGQY5zNo5Z
         wm5KksRZbXZS1r7eFWvZQSGuZ3JRubE/dcohD7ul1bXj4wO5oSFEK6D4VZ8hGJxcb4fd
         wQwS8uVHWkLmqwzmbmAAmySvAJlWnxyfldqWvD96uKVxh2oP6Fa0Eo03DMZOlXFoRSkp
         6pEjC8JTReV9qEVqNO0UvLAuqHhQarz++sdSvHX5naJnx2yEqdQngELkDALfYJDk03cg
         +IMPFZuZdMxUU4uwMb7/ktrZI05hTJRgPJ0UTyjCUcQnwDT7eMHa7MG2UkPhgQ49LLXw
         gU4g==
X-Forwarded-Encrypted: i=1; AHgh+RqE6oKw0SE4kFv59WpsLsqUu3AlWb85CxuUtWib3ehF/A72c769LYPlzTZ6vbPOWwWnXwAXqZvujxqDPA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8MYpGmbWUzmFK5UqsutJNyoxQTilrisqFr+0GLH1jbOCx/ggT
	+H2DPT4uQ19iheJdJ8QzQyXwfoLt749hzNuo3OrdAGliFXz9HJDF3AvDqUGJG23Q6Js=
X-Gm-Gg: AR+sD122bvJEj7sQWpCkzwMbBvJLFUhGWyzmV31f2hsFim766gby+FbsUmM4l2rtWfI
	mWVE3tPHlD1fflQMwHNX5k3YU6ymDhdNf8ZK2LCw/30GoxW4emKyJ7Dd8hhkCNkZdhMjVqEQ8Yz
	7s+9fl0FP6v9vyMYcrmVcfqptossjHtrFvHe9p2Nzzm/s8RBkBwxTfy7U2Vh8oZ5rFV+BLGOlCc
	JqgP/AHxjb921MhxoEGA4Hbi/+7yFkUF4t2y6bghtb5DW8U9E+ny158gGBzmD29TrrP3eCiU/d5
	vX+lN7dcdakwQz7mkzOMzFwrIp2i70FziiPW7GOyNI/dXgseL0mUY+s3OUXosE1KIayeiXAXd4Z
	8y6sXej398jZpy1C2AUIz5Q8Rf0C9i1hdwz4TULBt606L35slPQ/ax5E8ozDXMy7CfzQ6PhnP56
	7Dzvfp0UOaD53SCZhqFgveWOFKXyDT1x3+fjs5EihL6VK51RS/TFNgWNUx+gfKWPDMZyGuwgh16
	2hFhl65ODCCsKC7ShKq2lpRBWvTpYIzmx8kdaSocnFgLCQuTAmS8oTo
X-Received: by 2002:a05:600c:37ce:b0:495:58fe:88e5 with SMTP id 5b1f17b1804b1-4997ac86c84mr97794675e9.2.1786535564943;
        Wed, 12 Aug 2026 04:52:44 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:405d:735d:801e:de34? ([2a01:e0a:106d:1080:405d:735d:801e:de34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48150d5eb2csm6558329f8f.30.2026.08.12.04.52.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 04:52:44 -0700 (PDT)
Message-ID: <05d2ad33-a681-41e4-87f7-e3aaeb5428a8@linaro.org>
Date: Wed, 12 Aug 2026 13:52:43 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: Add bindings for Novatek
 NT37703
To: David Heidelberg <david@ixit.cz>, Esteban Urrutia <esteuwu@proton.me>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260811-nt37703-bup-v1-0-34ad42b064a3@proton.me>
 <20260811-nt37703-bup-v1-1-34ad42b064a3@proton.me>
 <8c3e9384-7964-4d03-a3a9-de15d26de822@ixit.cz>
 <58d7ddd4-1488-4c34-be85-6345138aa238@proton.me>
 <7097b617-90be-492d-9637-4a2a101379e0@ixit.cz>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <7097b617-90be-492d-9637-4a2a101379e0@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/12/26 10:46, David Heidelberg wrote:
> On 12/08/2026 07:21, Esteban Urrutia wrote:
>> On 8/11/26 9:05 AM, David Heidelberg wrote:
>>> Hi Esteban,
>>>
>>> Usually the used pattern is vendor,ddic+panel-model
>>>
>>> novatek,nt37703-motorola-bronco
>>>
>>> ...but motorola bronco isn't the model of the panel.
>>>
>>> My recommendation - look at some video of screen replacement, stop at moment
>>> when FLEX cable from panel is visible and that's where the panel model usually is.
>>
>>
>> I somewhat doubt the panel model would be located in the FPC cable.
>> I did search anyway but didn't find anything of interest. And I'm not
>> willing to risk damaging the display flex or the battery of my
>> development device just for a possibility either.
> 
> No-one asks you to disassemble the device :)
> Sadly, I haven't found any video doing display replacement either.
> In worst case such as this I assume it make sense keep the phone model in the compatible until panel codename is found.
> 
>> For the compatible pattern I used the implemented pattern for the
>> NT36523 TDDI, which is also used for other ICs such as the RM69380.
>>
>> So, I believe it should be okay to leave the compatible as is.
> 
> I would like to hear a word from Neil first. In similar cases like this would make sense to have one way defining these compatible strings used in phones.
> 
> 
> bit I missed in the review the part:
> 
> +            compatible = "motorola,bronco-tianma-v2-nt37703", "novatek,nt37703";
> 
> Unless the driver is able to auto-detect the connected panel (unlikely), novatek,nt37703 doesn't make sense. The DDIC without the panel is useless.
> 
> For example, in sdm845-oneplus-fajita and enchilada, we have the generic compatible because it was introduced before, so it's kept for compatibility reasons. There is no need to do that here.

Yeah today the norm is to add the ddic as second compatible entry so the first compatible just describes the pane, so here it should be:

compatible = "motorola,bronco-tianma-v2", "novatek,nt37703";

Neil

> 
> Thanks
> David
> 
>>
>>> David Heidelberg
>>
>>
>> Regards,
>> Esteban
>>

