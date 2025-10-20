Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127C1208D0
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:02:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760961756; cv=none; b=c5raC0eA/CvFgsb1RQgAu9LEATGHX2S9FKqQXtPz60Smq6h9hFqcFaED+whoSQceqLhw7+oZC/WHXsBUx/e+3SfisdBWv8WVae0R7hXnTn9UqSeaClXdvHvEl7P9bLJT7HD6OFaty8F2RWvvE2hJhe3T6BSXpy7NAF5xSL+i0AE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760961756; c=relaxed/simple;
	bh=PH78YdDSnzwxCHJgRiRybJMbpOqlc4brc9B+cBQ8knI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J4Y1XXFSvss/+Lk6CWriYN08gRkDp0txV9XgAv6opK96izC9ClLnaP0YlmU+RTwcXlzw2tG4GL1Qm8MtcEACbJKrXJr72DZx2RszvJU96+Mnw7/47syvvhKdLQLA2TWyQ+64jFVFY+HMQyBkhLywTO02JZn9Vh5ibnXTi6aT4P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k1lm7zi8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k1lm7zi8"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBFHWe004912
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:02:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIG694y6bAFJewqTAATkKo0qZg41tPW6hp12LV4gekY=; b=k1lm7zi8ubgptaZY
	JLhGvPqwvs/nB1B4ubs+IFCzETjhma39eF1OCc2WY/KcVz6r3GvJ2pxxjAbjm4mk
	OQhmVq+YAjWp4/u1P5ACrVZKjEyfRzHMdtu1WuA9Y92FHgT1Th1UOikmKCZD455P
	URQ0G2SN+nGvuCZVFR1PPzPoQR5W9lVLiLGzkdCOKcaQJxK2uBbzwkUgXjC+jxxX
	vlz7dtOdNRjkYDrNhN2Qdz5Ww1oQePNQLl1MMDz/Sqz3njU64D/OQfmyXYp7OkC3
	K3rxaxGBtSpzXyr1obmn2sALFFWEdiUMapm/OS1jB57Q5jYt6zLlkPwTQlLSdHuO
	mbDXkA==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v1w7vqt2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 12:02:33 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5562b30f35aso243116e0c.0
        for <phone-devel@vger.kernel.org>; Mon, 20 Oct 2025 05:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760961753; x=1761566553;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oIG694y6bAFJewqTAATkKo0qZg41tPW6hp12LV4gekY=;
        b=ohodRbYTM+1P/w5rRfid2fv7VZrHBmaLQTaEEnTl8Rzm5SphZwnPkNU9O69r5hoyjX
         C4j0mFlvefkFa4gg5v9hYy0r6tyX6r2KFHf2wsvjulxbV7BOuc/8uv83ZQwRyGGN0IPl
         lTFEp1I09T+Bz6v8JsrpzCa8wIazO6szYBVqHhv03iB5K+PCvYiInOlhQa5SnNKNAqim
         Xnxhf5u9PlnANq/R5lJuEXJjfDGLAv0J8gWzWVmm8F5KmbT0MgCXgYZ7crnBvI65qG1v
         sHkOrxGXMLZOUw4GJHMLJh+WHGaV1qBdGi3GdcUSQ1VuGWiryuuVTdQVF0Ohr1UJ4ZXU
         1mBw==
X-Forwarded-Encrypted: i=1; AJvYcCUbWRunlLobTAmlGCxX8eCpRJ7oy3EGdEIYz53S2BZ0e0BdTj4c9gZTA9XCCu21a1DD87tnOPhKckO9ZQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGVv9GPQoms70HB0oPae6GA4Ltv/x/0dHCflzDAslfyN8fBp1i
	FFoQOK+Jj0n0ESWx4x4drmAbnly48ys63q5LnJHWW6daeOGGRl0SDLmwTd04IVZtZ3tdBlwA28+
	/V0hZdcvvHVc2oAqvCqHwLaVGfF3rujiMBIJcBlxV2eZK5eUGUq26ms+UH0l34ISxfQ==
X-Gm-Gg: ASbGncveMGZQhawtg65LEqtHVfR374aFMiCysem7ADy2K7LXCgYPTUViw3475ypEgFO
	eHtlZEdsxVpqn3Re7bho/MB99NVdPeUdBcWs4V+mII3GvZpwwnFofurOn6bxmCYIcHPQPzEo5AD
	l0cuNdibAT6WHa3r5yVLR2G5OKI4TDWtAF/vNg1aLEVyq78PaYWWN8ILLbTC31OA9WhqGzoyczr
	X9e1hVsfUYwTDQzoK7rVJmFW7NsXzmnfKtwzsNNO5mAlWSAgsv/qkaDFILdLrqab0+ZDrcgH9D7
	an6Oxo38JHBMMoj0K4Vnsnxkr9DYNlQiom3jrkeIyVgokawoO213JIVN5gx6CyO1ggLf8euxlvW
	xNLe4uvr1SHI7KD/X9XO300LY4EXP/n9+sCsqNASMhtNpM5Pn/c009QM4
X-Received: by 2002:a05:6122:3293:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-5564ee8267amr1600192e0c.2.1760961752960;
        Mon, 20 Oct 2025 05:02:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExb3d7wrCskvILwjadrYZ35oU1mcZoo+ieMX1KAj9vst3Hy1cKTiA0tq+qNgeFvEo1O8fu3Q==
X-Received: by 2002:a05:6122:3293:b0:544:6d56:eef1 with SMTP id 71dfb90a1353d-5564ee8267amr1600161e0c.2.1760961752579;
        Mon, 20 Oct 2025 05:02:32 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb036b2bsm790493166b.49.2025.10.20.05.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:02:31 -0700 (PDT)
Message-ID: <41c63020-9226-45d9-979d-429b7299da41@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:02:29 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] ARM: dts: qcom: msm8974pro-htc-m8: add status LEDs
To: Alexandre Messier <alex@me.ssier.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251007-m8-dts-additions-v1-0-53d7ab3594e7@me.ssier.org>
 <20251007-m8-dts-additions-v1-1-53d7ab3594e7@me.ssier.org>
 <6c791f05-70e7-49c9-a3ce-50fb82b0c894@oss.qualcomm.com>
 <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <fef52764-3092-4375-b9c7-793d85adc102@me.ssier.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxNSBTYWx0ZWRfX4cP8PyDm9IDs
 xjzU0nVMyFwmjb5IBoxojX/T2z+u4r8dRewXhVY4O3juMifpviqgw5tUaHJNCWHYL54ubgxOFYy
 G91npp0EDPBYa6fMAkZg2GaMzkJy+5EHtGhPnoeXH+eTE+AvE3cMEBXtzZzHAdvRjzEN8siOtr4
 K+qPuwzadceQkNGhw90Vgc8j7nXnwOB7fBWJ7jsXTzzArsBIayVcmVeQTHtW9vIvHvX+CKsSgrn
 cnVR30ovkvMbmXQFxqdg7I4TxjhRB7g/L0iPNcAF6bXjSYHFmxCZ63ZLWWPN69aKqPoAGsd7FBi
 8w8yBEEDQd1uMDS/1NfgazZl3ycx+WWos7myxHZEmidGH2lza6uLOo4qEdLEpaYD3RYMiuTW7WW
 8qBhvKaVyOJT3X9cglrIZxCbc5/sJQ==
X-Authority-Analysis: v=2.4 cv=bNUb4f+Z c=1 sm=1 tr=0 ts=68f624d9 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=8poMKPHdAAAA:8 a=glctJ2XmOvm0yIQHyQsA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22 a=fyZPtLC9JlAwSkJ5-iUD:22
X-Proofpoint-GUID: fE2tCERtS5AT6UC95y6oe9BMfNdbmgRB
X-Proofpoint-ORIG-GUID: fE2tCERtS5AT6UC95y6oe9BMfNdbmgRB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180015

On 10/12/25 8:03 AM, Alexandre Messier wrote:
> On 2025-10-07 06:03, Konrad Dybcio wrote:
>> On 10/7/25 7:55 AM, Alexandre Messier via B4 Relay wrote:
>>> From: Alexandre Messier <alex@me.ssier.org>
>>>
>>> Add support for the notification LEDs on the HTC One M8.
>>>
>>> Two LEDs are available, one amber and one green.
>>
>> Do they form a single notification led, or are they supposed
>> to act separately?
> 
> Good point, I had to check the phone user manual to confirm. Indeed, it is
> referred to as a one logical notification LED. It also mentions the color can
> be either green or orange, it does not mention using the combined color of
> the two LEDs.
> 
> So I would say they are supposed to act separately.
> 
> Hope this answers your question, and let me know if more details are needed.
> 
> BTW: I will be sending a V2 to update the color name, since the user
> manual says the color is orange, not amber.

Let's describe it as a single LED then:

multi-led {
        color = <LED_COLOR_ID_MULTI>; // notice it's not RGB
        function = LED_FUNCTION_STATUS;

        #address-cells = <1>;
        #size-cells = <0>;

        led@6 {
                reg = <6>;
                color = <LED_COLOR_ID_GREEN>;
        };

        led@7 {
                reg = <7>;
                color = <LED_COLOR_ID_ORANGE>;
        };
};

+ Pavel the LED maintainer, please take a look if you think it makes sense

Konrad
