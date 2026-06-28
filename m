Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A6435A381
	for <phone-devel@vger.kernel.org>; Sun, 28 Jun 2026 21:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782681746; cv=none; b=R/ZNqQn1YjB3YqBLU7dmZx/9QCc8Dbd4fo4Y1wsHTH2jd0WPuoATtwQeqfnOwCU4/VYhk/MEBl79kn9X7AJ3Owxw649bfFUEb0hImCLxcxBC1QACT4B/ijDZWgqUbf39o5BEhScG8Ad5bj9RTuRloryqkBG+gVwZJ4rAbsWvLR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782681746; c=relaxed/simple;
	bh=a6hO2bkyGimNoQpAf6PDpshymlShF6v5MfnLUcqOnOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M43ohzE0eKlevZrVY8o48uRPOdqxpPPbMdDJojKV/wNQNhoED+WzdXb64sRQUgiGHM29KfOdH8mwKkBKrEJmlTWx/h9N4o06mLffC3BLlHJgIxoPZhqD6K0TK2zCfvVtCQrV+GYE0dVWiFJJEvELgkRUmlZLw4a8oaoyqeLFf6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=JQmQT06+; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="JQmQT06+"
Message-ID: <0ca65209-0b03-4458-a11a-24e750d10bd3@postmarketos.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1782681742;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=hrMUHiWhbzKBhMjauXMj8VHHhIQ7W1Y3uTUD0rFqkSc=;
	b=JQmQT06+7zubY1s4BmHzAcHjzkWiRWe+oiYbw0wxCZbKEyspf/p0yd8ww9Zs6CJX+BZvOR
	qbXZPrRGSTjE6hlDe+YvnPTFiPYHPnfYyszs4ElQ2a0fYra3hMAZoDZ/ex3+b7KTZvzx8z
	O6Qejnv6U47R7lXfI/oMgW+GBgVIp9K4CC2xLnWTOFi+FBmk6OAx5vg4ozCG3TN+GY6OH+
	5R9i+5R1iqjb++V18/q4esb3O5FzXQLk29+pxqYAcsKVpzVeLOfU+nlbyVSCsOXnV2WWoF
	UN5lpxQr4NrtaXkcdbI22v71q9zg1to7R9CsPIjJ05olOCs+e/b7pAFA5oob2g==
Date: Sun, 28 Jun 2026 14:22:03 -0700
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v3 2/4] dt-bindings: display: panel: Add documentation for
 lg,sw49410-lh609qh1
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Jessica Zhang <jesszhan0024@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org,
 Amir Dahan <system64fumo@tuta.io>
References: <20260614-judyln-panel-v3-0-07f4134441bd@postmarketos.org>
 <20260614-judyln-panel-v3-2-07f4134441bd@postmarketos.org>
 <20260615-thick-trout-of-inquire-4e4251@quoll>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <20260615-thick-trout-of-inquire-4e4251@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 2026-06-14 10:38 p.m., Krzysztof Kozlowski wrote:
>> +properties:
>> +  compatible:
>> +    items:
>> +      - const: lg,sw49410
>> +      - const: lg,sw49410-lh609qh1
> 
> This is very confusing - why two compatibles and why same devices - both
> sw49410 - are compatible with each other?

Hi Krzysztof, yes they are both compatible. One with DDIC and one with
DDIC+Panel. David Heidelberg suggested I include the panel.
Is this the correct style for both compatible?

properties:
   compatible:
     items:
       - enum:
           lg,sw49410-lh609qh1
       - const: lg,sw49410

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
