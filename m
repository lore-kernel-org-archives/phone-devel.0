Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3145F1DE887
	for <phone-devel@vger.kernel.org>; Tue,  7 Oct 2025 13:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759845344; cv=none; b=uYDto20/WP7Af7fAPcAlZw7s1Z+yxzFisD7tW4boHOoErMCJYSINbft6pwjZBX/ZCU9WD7Kh0B5QU1xRHDKZUhaDG318GogxYANKjfz70OlmTK2pJr4cGl9nNvtbvG3hlUtRrUKBCCBvX3O/KSZLU5VTrTQMeavYHVgN/CcGnV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759845344; c=relaxed/simple;
	bh=N9qdfaqqehWWuUI73ra8Uu9gFKR3Pihqz6Oy79KUWl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wx1YQXCJKe8jo31R5tP3fmMt3SRehvgkAY9AeiglRWYlBSp+6ScfxBw0pHxrct8Rej9NOO7V3bBsR9vxM2jMKrwUMH8CbFAYE4dM6OEQxuMniKkhU/4ScgzOYjf4YOPpetxEL43gPl9/Uqf2FI0jKnYQdl3NEYprBZiLRYhfzXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Rv9836Hx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Rv9836Hx"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597C0Te5003197
	for <phone-devel@vger.kernel.org>; Tue, 7 Oct 2025 13:55:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZawunH39fsjLdjYkyzjOOeRauXShTP9A+eqv2749nhA=; b=Rv9836HxAh0K16UA
	RT5Fg1NE5UBd4f7azIwbcPwjlzC3WLWStME7D3uRAHaX3QqU1BzQ4GACSY5quRW9
	txeNwzrePS+NA58J713RFPUXKbQ7Awfhra33g9I9UFf9NroG2gCs/QnVHkjTmFY0
	dyp+wwytoYY4zwKiXtTN0vMThKT+3s+TjBc43sw+Yku82WIIpgdPNdwQBjyYFoWL
	p0/gYITcccsdudY6YY/Zb/V4wBw5D5s/PVBYtmF1JQCldKkdws3+wLdIoAh3Lq8m
	K0wTjIkHXyUDW4KPvYi9uHcgrBMw/pqLkn+ZLJ6OlEQFNZ2gxa4TM5uLPtpxGz5F
	tfaB5g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jtk6yemh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 13:55:39 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e231785cc3so26197741cf.1
        for <phone-devel@vger.kernel.org>; Tue, 07 Oct 2025 06:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759845339; x=1760450139;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZawunH39fsjLdjYkyzjOOeRauXShTP9A+eqv2749nhA=;
        b=cMBDT+RRg0C/eyyRy3ab3Wv8q28AdrUhcI1f+PC87LBylNhhwS7zqnyzac5npL3rzo
         E023yr7mbyp4C3sp8ikLxXDU3Rrf04WWSVPjjMmNFRvM6S5uscTJedSr5wTZbJWR4wb3
         Fr0hpzG9NiI0EL6d0YBHj8dxWR0Bfupr0XOnbctGrKnAD4I4Z1+7KSztjXrkyVcMSrAf
         LarBaEyrWIBO1minXbF6Bifp/bvs15hlT0reNR+es7P6vyVQCduexRK2PEc/VsdParIY
         7+QUMQ5y+QuuVa5sBbRIF143p64TGAb3S839RNK4BsZX6Wfc05yke1ScuzAMt+dUdMbQ
         LgtA==
X-Forwarded-Encrypted: i=1; AJvYcCXfTM4U894iB5kNQnbYrQGNh3ZtNt6ngDmxoNHzXGjssJb3rv91TesLEVlZo9tJ7IczN+U0aHW6Ws+hMQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/bQNqRcD0uPLkkPv7+vrUfqMXzm9Mw5SBPVenWLYBq79fcZ/
	eoN+1n6LvG5Y4XqwLhy5S4O0NGrGw02b/dnX2Kz2zWjeTfY8N0fVKPxvAo4LVj96/j7tdtO0PRw
	+tkR40fh1Vbw/FCN57Sha2eEIzdAyTmiv++NAlkbWXY4ZysoEhDPJPoTihSxicqUfUA==
X-Gm-Gg: ASbGncsgWTyEqhKKByWUvxlrlHje4JH8yyFay/MzTIueGmT8YzfRAh5Rl4ckCh3FqM4
	Wkz0p6SQd4IT26s9O4iCTYvr6v3byBtjC0poO4AkLjJbJxZPMt8PNhSBBxeJcsv0vzsValh0tgM
	p/teFaxwQlJcEMjd+Eh1Pv6ztWvV5pzMIchkSIwID5b7dfeSaSWYbj9w47UBIONgpce8wZr8z5r
	cx8gioiCobjSoz9dbjuP4pPoSTDnPNDn5p17UsQRVJqYt/TAFpOEY516GuseRDbYb+qZCPDza39
	shLWN56cBi216QFwyq/YmHWnQnC3cC13IMCJz8uhmLJvzxegfSb1ofq0hkAARM7FdJSbfZhx1gV
	4p5gLFFPD55sjKOH21B9A+JSH7bg=
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr148761091cf.10.1759845339098;
        Tue, 07 Oct 2025 06:55:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/aNH7N1c2ZiYNPq20l0pNGWjN0O/b0Y5a0V5Yj5aczYTN0tC9/XNNjnxTio4u3+gGdP2blA==
X-Received: by 2002:ac8:5a96:0:b0:4d2:c24f:8495 with SMTP id d75a77b69052e-4e576ab6f37mr148760601cf.10.1759845338476;
        Tue, 07 Oct 2025 06:55:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970a4bdsm1403765466b.49.2025.10.07.06.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 06:55:37 -0700 (PDT)
Message-ID: <e58978d6-dc6a-468f-91d5-29d7b0755e79@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 15:55:35 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/13] arm64: dts: qcom: sdm845-lg-judyln: Add fb_panel
 dimensions
To: Alexey Minnekhanov <alexeymin@minlexx.ru>,
        Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250916-judyln-dts-v2-0-5e16e60263af@postmarketos.org>
 <20250916-judyln-dts-v2-9-5e16e60263af@postmarketos.org>
 <de1a7ecb-924d-4ed2-8034-721b8dce69d4@oss.qualcomm.com>
 <ac2d419d-a1b4-4b3f-a07a-4f5d047901aa@minlexx.ru>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ac2d419d-a1b4-4b3f-a07a-4f5d047901aa@minlexx.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAxNyBTYWx0ZWRfX9r7ekQ8HPHKp
 czuowOoqm+ic2HjZHbLlMQANuuOGKi08/HsOD/ymSO2qXfnjzYBNFkg229k58TtxgbNorWaXv2F
 STEBNrD37lLkRsM+JhFG+nSD7GI6ZZB73ctWQdrBoW67Baxx15rVHgTQUZz2DyMOCUFAL0fi+bY
 YawJkWIVKxDZ352dTy48EaoA+DhUM7F06PVSAo1tu8VxG/9y95brKjSTmMltn34Gixq1230BcSu
 9ojUmQaJql1BoYRuydtj+u91Y3g9G+uMIECNlTRMAlC9pCQw8mEO0XxcRcrtQnG6iCrggrn0Lem
 SxzecjWfNy2ozS8EFqPsSqVL5B1kWNqC6749WNkrcu8L/WIgQLosTV93FOcGH2lG53i+5dL88cE
 6wtsKNcydtoO3NcPD44KgIYV9WBJSA==
X-Authority-Analysis: v=2.4 cv=do3Wylg4 c=1 sm=1 tr=0 ts=68e51bdc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=Gbw9aFdXAAAA:8 a=k_tMZpwa-Rke7L9fme8A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: TrmTSNd34fP2Q06WNJGyYAAkcY70AOtv
X-Proofpoint-ORIG-GUID: TrmTSNd34fP2Q06WNJGyYAAkcY70AOtv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040017

On 9/17/25 4:54 PM, Alexey Minnekhanov wrote:
> On 17.09.2025 16:59, Konrad Dybcio wrote:
>> On 9/17/25 3:09 AM, Paul Sajna wrote:
>>> Add display dimensions for proper scaling
>>>
>>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> index e84b45ed82fd13850ea7ec1f34ddac5b59fc1434..8c1692f86e6ceea7b718361965e78f95d39373bb 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dts
>>> @@ -23,6 +23,13 @@ framebuffer@9d400000 {
>>>               format = "a8r8g8b8";
>>>               lab-supply = <&lab>;
>>>               ibb-supply = <&ibb>;
>>> +
>>> +            panel = <&fb_panel>;
>>> +
>>> +            fb_panel: fb-panel {
>>> +                width-mm = <65>;
>>> +                height-mm = <140>;
>>
>> It'd be nicer if you moved these properties to the actual panel
>> node (the DSI one) and referenced that one instead (I think that
>> should work)
>>
>> Konrad
>>
> 
> Hi!
> 
> First of all this code doesn't work well for upstream, because it causes
> errors with dtbs checks like:
> 
>   framebuffer@9d400000 (simple-framebuffer): 'fb-panel' does not match any of the regexes: '^[a-zA-Z0-9-]+-supply$', '^pinctrl-[0-9]+$'
> 
> ^^ The subnode is not allowed by bindings.
> 
> The whole reasoning for this little hack is that the upstream
> recommended approach to solve the "unknown DPI" for framebuffer issue
> is to put width-mm, height-mm into real panel node and and reference it
> in simple-fb node - sonds very nice in theory, but also doesn't work
> well in practice, and explanation why will take a bit longer, please
> bear with me for a minute.
> 
> If we do as recommended, device tree structure will look like this:
> 
>  framebuffer@9d400000 {
>      ...
>      panel = <&display_panel>;
>  };
> 
>  soc@0 {
>      ....
> 
>      mdss {
>          ...
>          dsi0 {
>              ...
>              display_panel: panel@0 {
>                  reg = <0>;
>                  compatible = "lg,sw49410";
>                  ...
>                  width-mm = <65>;
>                  height-mm = <140>;
>              };
>          ...
> 
> Then, to my understanding, due to how fw-devlink works, the panel=<&..>
> link from simplefb node to display_panel node creates a probe-time
> dependency, so that the whole display stack probes first: MDSS, DSI
> controller, maybe even Adreno GPU, *AND* panel all probe first, thus
> making the mere existence of simple-framebuffer pointless.
> 
> Additionally, simple-framebuffer probes succesfully after that,
> creating "second GPU" entry in as /dev/dri/card1 making it look like
> system has 2 GPUS, which confuses almost every window manager in
> userspace later. Normally, if simplefb probes first, it gets unloaded
> and replaced by MDSS and does not cause any chaos. In the end the whole
> situation looks even more silly than the fake panel subnode hack.
> 
> Therefore for upstream I'd recommend to just drop any fb-panel hacks and
> to not use panel=<&...> with reference to real panel either.
> 
> It would all be much much easier if we could just specify width-mm/
> height-mm directly in simplefb node, but DT maintainers rejected that idea.

Would adding post-init-providers = <&real_panel> help?

Konrad
