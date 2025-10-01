Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772131494CC
	for <phone-devel@vger.kernel.org>; Wed,  1 Oct 2025 08:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759307881; cv=none; b=GyyleqGQ3DLZjhO0kiNQqqsVYp4M1MuDxd3zxMZjQtNdxh9fxCJgHs2R0/S89144/4HtmXUaKBDYy5JISjX96K5hcNWC5A/noFzdr6ADV7jd0RVHwc1zPBXWIocE0UzAAzVa4XxE2C/7129WDBndQtWIIjAyubjSChn6EkFtvz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759307881; c=relaxed/simple;
	bh=SOdkjX+XhcQsICcnoi6ql60tKZY6QeQ8R+2qWbiph7w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGfe30qIfZRttkbFtDQP8F9AQxH2VA7/yhermcVgAFDLacIf5x1eo5BIQ0wTRhVoJz9OqcbVnxptrH2MMXS251kuSXw5QtS04RHbR6jp/8jUl6FUY4FnKUmItmQd3ql6Wjqw79yPJIYvIDJS1ZOeVyEs+he0uXi/ey5iOxiPcCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVHewn4u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVHewn4u"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ULmakH030546
	for <phone-devel@vger.kernel.org>; Wed, 1 Oct 2025 08:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KUFK/Ss0L+GF41vSD/7pSbyI+R1mc9WDz2eWU41Xx5E=; b=kVHewn4uRHjzBxmN
	Flm/1Jx7dkSemhnTbNVmBuI46bOtjsQ7yoIlvUhPOXiRikvmJ48rI4kBzOsPPiY4
	9aIGbefxkauuk6XciVy0M+ujtPpGMXDVDbO6Rb7VBaTmYxG8xERMLr+rT2/ph2iV
	UhcAnu9UHM9BmpM4o+mTA5l6yAHTAG4fxMnJFwlSO9Wgn0MvF6/0QG0/u6oZbcye
	UnHqVx1aHACN5kUMvGHgTf8s0QJmWSr9H5m1NZYqpdh4ewANAegUIhHOIXKyaOuO
	M35Adk7y1VllkUbKkUumatcevZry4gGj4zqS3oWc/mH1G+/uxDdpD79tJt61/QLe
	iYssKg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e8pdkmvr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 08:37:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8649a8dbff8so113276085a.0
        for <phone-devel@vger.kernel.org>; Wed, 01 Oct 2025 01:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759307878; x=1759912678;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KUFK/Ss0L+GF41vSD/7pSbyI+R1mc9WDz2eWU41Xx5E=;
        b=VxpOl0dvjnKEbvY2HuLt8pHs47HN+7xtvxmqN44eAXGMvAfPZpYq4xfssZdVrIz7Id
         9BL8bgwVxTUR/XLSyYsSbjm6aIbXGWxzGOYMmU8CmsXJyhzaUMKV2DYZ/XpvHEBnHB8e
         ZB/yfnCZE+XKlALZUkYH5U4VyHF66f5asqz6bjxhsxjuxEiYYwkC5+N/ExBbLH/SO/Om
         IcRr0cnd7N6yI83Tep3gmphmFyVPAHlczGdJJPVI8D9RbFB7f/z9hBZaN72j/BVFLGwG
         pM0z4KdPNx8mAuJsF3MH1s+B139rXUAsYJUARKaDuPI2FWIMlYfZLYPvXzgUL8vvcRa2
         2ZGg==
X-Forwarded-Encrypted: i=1; AJvYcCVzPnxEiug98PBS6U0HK/ar3hY0/eXuzGt4I8fCanc/aldmUNo56vFSKEd0w08GQZJkmBGYjPDzyt/PFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxmpmm0C3DeZQCa/usV6eDcLcNfGH5qAqOXa7k1It7l0oBszhcT
	F3ytlhO3nm9ciS+Y8ds0D5Crax36Y/Bhj7CCJtK3oMDwyaih0gK8xfqntc23+gterHRnbIZv5ti
	Xpik+Q7eMbI6Yc7Fm2i+uCol9+Q8eCZIrfmLsC1bibP8/9slRePAkD63BvYU+v6KZOw==
X-Gm-Gg: ASbGncu1OwrrJMyd12PZYN5mR8/L6XcMlSo9P1Q/W7ZAuB3aVSrQusqmdWma2nwBEs4
	7B4ZBQI+LifY0jeLjWHXEXGu4ZwdBaOcVFjYh11NhvGXzabdvsgCF5NBY9HlUjIVlO1l7y8zRhZ
	JtPoRgsdYV08KzJMjKD/kTbz9WLNrweGejb4kegGEGAjJMeGC4iSEqTcY/piQnRNakhimjV3kQi
	S191u0CjgvQ0tS45x6doe5KsmuPTxmZQ7eP6T/DHluwcKPtYUz62qa6QFo9sLVFPmOvJ5GjrQb/
	eYffYXY/p678FVO3gU0YgMp8eq4brq2BHr/CZHF5CGGLP1O/HcsMX6e9VivaKgxK8/x+OFjh1z/
	OmDq4hS/qOT9zRPXEUxq4a8MQWOo=
X-Received: by 2002:a05:620a:294a:b0:863:88f9:3edf with SMTP id af79cd13be357-873768a51dbmr256002885a.13.1759307878196;
        Wed, 01 Oct 2025 01:37:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdWKramJMBSaYig5g7VcPPZxYTiTru0aoo2NQ2bTcuSp9N2EDYIbAH6ZqLIO1HALQ6lWfzyA==
X-Received: by 2002:a05:620a:294a:b0:863:88f9:3edf with SMTP id af79cd13be357-873768a51dbmr256001385a.13.1759307877747;
        Wed, 01 Oct 2025 01:37:57 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3f57c9c2e2sm562881666b.68.2025.10.01.01.37.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Oct 2025 01:37:57 -0700 (PDT)
Message-ID: <d2b1aef1-b367-482e-87f3-eb08d0bee9cd@oss.qualcomm.com>
Date: Wed, 1 Oct 2025 10:37:54 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB LED
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
References: <20250930-otter-further-bringup-v1-0-7fe66f653900@fairphone.com>
 <20250930-otter-further-bringup-v1-5-7fe66f653900@fairphone.com>
 <fc5d2d9c-7200-416f-ad89-4c1907e313c9@oss.qualcomm.com>
 <DD6UFOT1KRFG.3M6QJRGYRAJF9@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DD6UFOT1KRFG.3M6QJRGYRAJF9@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: HJMKbLmg4I-oG2u1OIzIozFfxiiAWnGL
X-Authority-Analysis: v=2.4 cv=MYZhep/f c=1 sm=1 tr=0 ts=68dce867 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=6H0WHjuAAAAA:8
 a=_VV5rCy9AiPTaJ_phtcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: HJMKbLmg4I-oG2u1OIzIozFfxiiAWnGL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAzNiBTYWx0ZWRfX2pb4s1MRGL4x
 n5hLzPM71ltfUl6RTAnOFF4xhQhiGV7nagHqxL5JrhTIM9DmEwcqhSAGlj7eLGgRgDx4I/o2a3A
 jYngfKZAgqpUjOEN6UG/6RWm646BmMUIeI0ueqalMzDn2QHEqPp2QkHjwLweIIRwn7izkMQfXhi
 /mBia/dEwNODZfVvlTYonk87kKJiE8i1651g/Hm4eSyXkq95+C5DpJm/eHJ29iOTZASe3XHEXUa
 f74xg26ma87mZjGy4uy/dGMyxmP3f5RC0SHnY8GMYPXqobNkU0HDH/fYnBc0NMNxlWLh1/cQCWw
 pfNeHKIK7MG81Ats7oRQVyPtRrYGddtRG3oTq6ZYuUnhGqBHWFP1zN02RWOp94Q5xDUEDWtI6q0
 Ir3oaacfdtFOIybBIG3IrSMijQExiQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-01_02,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270036

On 10/1/25 10:30 AM, Luca Weiss wrote:
> On Wed Oct 1, 2025 at 10:29 AM CEST, Konrad Dybcio wrote:
>> On 9/30/25 4:32 PM, Luca Weiss wrote:
>>> From: Luca Weiss <luca@lucaweiss.eu>
>>>
>>> Enable the RGB LED connected to the PM7350C (PM8350C).
>>>
>>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 27 ++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>>> index 36cc67469615974c193ea3a9db1b2362869d56bb..b4c69dc50ed0f0b3cb45341a01c89210bd261993 100644
>>> --- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>>> +++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
>>> @@ -632,6 +632,33 @@ led-0 {
>>>  	};
>>>  };
>>>  
>>> +&pm8350c_pwm {
>>> +	status = "okay";
>>> +
>>> +	multi-led {
>>> +		color = <LED_COLOR_ID_RGB>;
>>> +		function = LED_FUNCTION_STATUS;
>>> +
>>> +		#address-cells = <1>;
>>> +		#size-cells = <0>;
>>> +
>>> +		led@1 {
>>> +			reg = <1>;
>>> +			color = <LED_COLOR_ID_RED>;
>>> +		};
>>> +
>>> +		led@2 {
>>> +			reg = <2>;
>>> +			color = <LED_COLOR_ID_GREEN>;
>>> +		};
>>> +
>>> +		led@3 {
>>> +			reg = <3>;
>>> +			color = <LED_COLOR_ID_BLUE>;
>>> +		};
>>
>> I assume you managed to confirm these mappings are correct.. sometimes
>> they are not what you'd expect
> 
> If you mean, that red == red, green == green and blue == blue, yes. The
> RGB configured from user space matches the color on the LED.

Yeah that's what I meant, thanks

Konrad
