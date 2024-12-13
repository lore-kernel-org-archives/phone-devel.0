Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900571DF756
	for <phone-devel@vger.kernel.org>; Fri, 13 Dec 2024 12:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734091797; cv=none; b=U7gup5nVw3nscL0PrEivcyuw+Trrb3Lws7E0jJP0iRegnn05djeolUMaWOxv9iAs4UuROVZOAzX1clnPeFtePxSe2Kt0sFWd2A9HodJ/+oZxlCYoxSq5A1tQGRSfVMRPiPhazTsA6E7H1jBwduyyt6265GrFUF2w7G+sL8P5CEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734091797; c=relaxed/simple;
	bh=281oP6qwT10KC5cASlCTcsOtDLGcNGdhFI0idcV9z5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H/oaUOWhiAKL4CFmOH4j83rIRrFB/z7Dqz4jOf91Fmd8vsUxSNnJ0ozv2WuUB1yPa34SHAcN2pioa7YkJG6ohRbkPlqqytaIPeFHPzx8oIsoGjZiRd+3iPzmfRxNYQLEieACikZRSffhhiTL0hxURVk0VerCHiqInLFvp+uy+uA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rFHuZ0Co; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rFHuZ0Co"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5d3e9a88793so2653629a12.1
        for <phone-devel@vger.kernel.org>; Fri, 13 Dec 2024 04:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734091794; x=1734696594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kU/TAxCt8O0FWz8YtfbV46t6PIq+DpJp8s1Cxp3EtkU=;
        b=rFHuZ0CoKgWTQ6HQbYB35TM58bFyosIR3rH9wdVZ8ieHb439g/uAxGHm76IBiY3T9p
         pKxWP/IA0ygCGkXQLgDQDGa1W0xMlCikoCgCLHHEK9TTl8GyVj1EOyesqblgGjJb/xvL
         phRq79I/HiS4DukKdNBNFQ01BynAfTsNrfahiTu07wEbuspwy8OmhDakYdPggq+uuuJg
         Sojk3iv62ylfXPNNxJ9K3e/Sr+er3qLviPKnfYZunycWn1ochDM8yAOgrk3bfDm9tWF4
         vU25rNbCVtYXotK6COkZD6KWcBf8LIIMk3aSsXoB1G6bW5Dl1gThrmhWZipc/cF6IIdB
         zXzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734091794; x=1734696594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kU/TAxCt8O0FWz8YtfbV46t6PIq+DpJp8s1Cxp3EtkU=;
        b=al81e4A0ld8pniEdVea2DdnazmQr74cyFwU/jDZ/El95rqnAd8ll4FxowUmqjN3RwN
         phftb0EV/U8ufZJcd//tZk7yCOG/lWGXeYm6jg0QiasqzBO5GabVn/PoyCcOR1bpcjWQ
         RkkOTQ9JIf4cTvvkaO+pr83ymXuAvQbVENZaoSl/hrn8d9gKqw4tqvJ7EDsDropSoIcu
         LKiM4AK8Q08woNw8FpsHOsyreb6cYuD8/7ruM2xukpdFsFGJAnkDP4UBvGuK4R4/jZIW
         DZmI6+XJVuj6KkxNC388qdn7uLBS6iyaioEVD83HCKBhgfXUPnNKSRuBrezewgAbOcGP
         gieA==
X-Forwarded-Encrypted: i=1; AJvYcCVzu1tEHf4JUVaZly64U9rvzyUQVPbNu7EY2e1LtXteo+wFpEoWz8wpnSMVqIZAZSAAh8OAxM/+jwOtrw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyilYFlL/GvOGuv7IACoYJ9H+yoeznm0ITzR8YFv8q3OhaD9Xow
	4PtXjV9vr/uXJKs/XIPuVsTcD3GDNjY+ciDRJDdNDP7WBd9AZInNX5z957OFCoo=
X-Gm-Gg: ASbGncsU2JrzbKkyvI276UU4RA67e9OVZp+7xDQteNNvt1ArwlPN7JIE7ozqmVe3Ucj
	LHS5y3uLfQ1MkB+HedSHzk9GnHSDIBMrq+9vrc8GB8i+uxoTWA8Fv6fJdgtrBcdRxfmnWCi/rrJ
	wuBGtRjxREcMOYk3L034bhGhbmsM6Ju8nS4dD4PNsIiZOrwWGlxYD2Hf8g+NFanGe993E+whgkH
	/QQ/i9Hemsgia5sRORwaPuwtdfcKIPy3pAj8fuKyYVCURK8SBF57vDh8fIq71TEHB5Lnw==
X-Google-Smtp-Source: AGHT+IHg0QPsSMkYDMNreim6HkBAf2q/HK4rWikIiumxCf6Lq9iDoqA7IB717TtG6/sfnrY5KpOkgw==
X-Received: by 2002:a17:907:7da9:b0:aa5:b1b9:5d6a with SMTP id a640c23a62f3a-aab77ed2feamr198015666b.54.1734091793863;
        Fri, 13 Dec 2024 04:09:53 -0800 (PST)
Received: from [192.168.0.40] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260e33f7sm1232156566b.183.2024.12.13.04.09.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Dec 2024 04:09:53 -0800 (PST)
Message-ID: <3d93e6d7-a740-4314-a5b3-03e0c8d7749b@linaro.org>
Date: Fri, 13 Dec 2024 12:09:52 +0000
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: dt-bindings: media: camss: Restrict bus-type
 property
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Barnabas Czeman <barnabas.czeman@mainlining.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Caleb Connolly <caleb.connolly@linaro.org>, David Heidelberg
 <david@ixit.cz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241209-camss-dphy-v1-0-5f1b6f25ed92@fairphone.com>
 <20241209-camss-dphy-v1-1-5f1b6f25ed92@fairphone.com>
 <nqggstwkytqxpxy3iuhkl6tup5elf45lqi3qlgyv6eaizvnfdr@2uy57umdzqfa>
 <e4bd515a-eb98-4ea1-8d73-4ba5e7c9b66e@linaro.org>
 <D6AJ9U23ANWI.1DLHNPU5A6HQ4@fairphone.com>
 <d7e3076e-5b32-4ab8-afe8-f52458769f23@linaro.org>
 <244ab38d-762f-4860-b38e-51b08389ee6a@linaro.org>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <244ab38d-762f-4860-b38e-51b08389ee6a@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13/12/2024 11:54, Vladimir Zapolskiy wrote:
>>
>> New additions should include this bus-type number as we will need it
>> when we add CPHY support and the subsequently move to the PHY API for
>> CAMSS PHYs.
> 
> This particular reason is invalid IMO, since dtb changes are not relied on
> drivers and shall be kept agnostic.

Its perfectly valid to add a DT description which describes the hardware 
whether or not the driver consumes that data.

DT is supposed to be a standalone hardware description.

---
bod
