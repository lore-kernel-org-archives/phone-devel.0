Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DAE42DA3D
	for <phone-devel@vger.kernel.org>; Sat, 26 Sep 2026 13:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790430058; cv=none; b=fpQQt8QpVtlIm35QkDX3dcr4E0Hp7dZMIUmjqFzJHi6FP+hB3H3le0nnHsZ5gT6jpH2l58gWYMi5ULtgHm5Mhu0vVA01ZxI/mAUTGs/89WyXqp0Z6O4V46MMo+yrzNQyzyUpadgYA5+W0QPcswc4Ufr6ltPiWx+o3FcRfxAJ1Ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790430058; c=relaxed/simple;
	bh=w6XavIMw57aHLiDolrRY4GGk/U21PS94Ij+L0KosGQ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RYhjLYtF2IbpQWryhggorYLJ3PzzwX+aQRY9fTjCcok4GL7L8UV7oEk30GNg/ozFbPZxkgLqg68LiAr2FY/pyc1GHSqu7+I8TbI+i/okFu1bX92qHSOycngEa2SIMqHWo8DxOEEHGjALB9neFcqtBUb/b0Tlxf+p/U4v85qXdvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LS4C5tZH; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LS4C5tZH"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so944926f8f.0
        for <phone-devel@vger.kernel.org>; Sat, 26 Sep 2026 06:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790430055; x=1791034855; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=LS4C5tZH+706MxGAzyunUKi/UJ8wRPQ2MUXJVBh7oJkifoIQPaPsc1s8FCz5ZHyauE
         RBT1SdJRlhjpxqvnjXMPM+q6hiVwrV83uj/wUqWEP1q2CJTbF93G5QNhpfT60CY2H/rz
         t5oQWch3G08E+hcEiTnQPvpzTeQu89sk8UQpKnRbITfFnlX+ecAYatDgMg83zTAB0jh3
         lHSlS4alRSj3oNWs5hiP1fc9yi3tEwk8zOm/nbqGdQmI+/Y8LWHL+a1L0gF/WMO0dQSv
         dfhszJc9qgKoFMMm/z8yQmgfkjt4VWJZcW+7f1QjOgpORVx1G78KPFJ2U7AOdzjmyi2D
         fV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790430055; x=1791034855;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bAJZqOMLmiD+huTN0vJljnBzZgWbzy5vIPKgZ6U/QBA=;
        b=vGsmrR0vCy48e6Lwhy7XzmU8AfUYnxJRk4G2AQZrJCFLqmpYBO5bPecm609TvOo1nB
         0EZG7GIDsVdR4Lewv8xvpYlNA2mS34RY36T+BTT1mUphqjdb35FI/MJ4s5r64Vt/I8tK
         uQ0uCFVbrk2Mlj44RuEsvaw2RCZP80IfEzKSQIbSJSMfdcc36GXFDQ/Qu/uIN0NEeq5v
         OIvRAg8SZ5EaGU5HMqPDpT3hMyhzoR/KzfVDkw/eWTXRX0xDrQ2FkX+DE3e3NEerZ4qx
         ElRv+ztIKRfKbmxdx2ZxhDLwtjd+qNalP4jvz5eV6JO33YPsdYtpXaZye4tSlmoH9EpK
         xVqQ==
X-Forwarded-Encrypted: i=1; AKwUvBw8QWS9fms2QmGR+3oOFFXK7c/4Zm2zqFNoU9DUb2Jb+riXKy3WyGKvapIytmO6CcpX8jrFQxTiiJg02Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYL2h0SkAw8SExs+Y/od1ayF1Fo/4lkdOlUkt3/4TtoGbfoua4cM
	ZFt5B0+QEKFAhrKqcS2r/DtFi7T5IMCG+il8vzBlG96Ew89pxnY00qj+vkR3TSxwhuE=
X-Gm-Gg: AYBFou2EDqoHS/TPleuxW2kMpd7F0dj2wxfw95tXehxUCFN/KzSvVOU7je2vC0nBXLZ
	jFhVetXdS0GvPWz+Z6ND3jOJQwdhMv+H/ASiJKvjZJxqSeUl6swAmY3dHz1EScvqONgb+G0XqVm
	78PH6i9YDM6Kn8cjiqqwMAKoBUSAcqzeA99ms71QmMACDezVGB0HbQTHOrdicMGxh7H3aR1+WS4
	j9QJhlDOstPjNydJ35T28achYrAjVpfXp0GbO8RYHanT5v8HcYTHKdcHSmdkCiHx5hPE8aT17El
	/PqQVhSD/2CselLOrSxkMwWka2zxUdtFQgGZ8Q6Z5FXDK07sqdWX66w5viKJONSL68QBQSa4oy3
	Hgjr8zJqvlxxSoRNyWf1Bi6KI+focYwWdUbFvDEtZoijKEJccW0HMsv94vx9rvWxO/xMq+fdxDh
	SdIKdmcQMFn4Yq1Y8iD/TJrSVeWkXo+4RcAYYSdVn5ryGF1/PTS2dy/ua7Sgva+WHXTHZSysnS7
	TcFkWlf6UI=
X-Received: by 2002:a05:6000:2910:b0:488:8987:663b with SMTP id ffacd0b85a97d-48889876a66mr2785861f8f.23.1790430055389;
        Sat, 26 Sep 2026 06:40:55 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a349731sm14660447f8f.12.2026.09.26.06.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 06:40:54 -0700 (PDT)
Message-ID: <bd0a8dd8-7d0b-441d-9b14-25fb153465db@linaro.org>
Date: Sat, 26 Sep 2026 14:40:53 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/12] usb: typec: qcom: Make typec_port accept also
 different structure
To: david@ixit.cz, Alexey Minnekhanov <alexeymin@minlexx.ru>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Lee Jones <lee@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 phone-devel@vger.kernel.org, mfd@lists.linux.dev
References: <20260926-typec-v1-0-31adc19f32c6@ixit.cz>
 <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260926-typec-v1-5-31adc19f32c6@ixit.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26/09/2026 13:40, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg<david@ixit.cz>
> 
> This is needed by followup commit introducing 1st gen of type-c support.
> 
> Assisted-by: LLM
> Co-developed-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: Alexey Minnekhanov<alexeymin@minlexx.ru>
> Signed-off-by: David Heidelberg<david@ixit.cz>
Same comment.

Understood its needed but, please describe why. I haven't read the next 
patch yet but I guess you are going to have something other than struct 
pmic_typec_port *

Again a minor nit you an fixup in the next rev

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
