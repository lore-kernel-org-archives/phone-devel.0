Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BE03B3C19
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773827723; cv=none; b=WidVIvf6EB/Mm86o8xhOG6sQUfVmXehbhI1Uctj35MMV8sMZ44SmuDZhfq3V/3jgO2gMHfFPTqfmC3XyhL8X6lMKqWitOTRVn2oUHfpYugNqpmRLKrVGuj6HyWkwJ78nuOJwaI1fIDxbz4tf4TfXopsmKQK1huIZ6P9GrzaZI0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773827723; c=relaxed/simple;
	bh=xIq0xMcTOPMyhTIaPj+JUxHMhqa9umyfkKsl8bwH1zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DhB54a3cTZUCcVQoeZJ5EVOD18iZJy+aVAfKcFV2K2dxd3aMfDRTIsGb1rH6MHwYBtYWlu4kqe2dA74Tq3W+3duFUkRfjT+Wle9+3oUimQOM/ezxS87q1qfe61VKaiGP62FZknqK/NXZKGb+NtjWziN9QUPExaI3TQ+8sqE235o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jUhhlM18; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWam8t4O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jUhhlM18";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWam8t4O"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I76Ytj2612575
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:55:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VCCg5Y1x3Oc6Q7IA8Ya+WunadascikyR7lZZKozdkAk=; b=jUhhlM18KmmmI5jI
	XsqQXmi3bU/4v6nD2wqegu7MsHrr6ihGMmBx9q0wpjYGdB/sGf2vJXegU+1lJSiw
	yYw6SfNbhlKX0ro7nuLoMORZeLANnLqqLyCKIJEx182ex/xF0LA13mHZ/NgtWuJF
	sav+tYhhzrwJskG+BzjMAEMQ9oCCYC7lNcPKn1QqzGy+/Nx7xbFxjOkYFFQYkAT7
	DrZ5+DH3FzGwe1Fd/tGMIcq5XRLlBssgiqNJa4ph/ZNHpIRKTnQYisqdFqTHveVz
	Aqf0FxFs0tVxNM8HKmP6gXC60UZokMqypTqnIMS7RenIpkOrxtgnHiFGT2yz1SPy
	QY62mA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cyqcdrr6k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 09:55:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89a012f8ab7so44868236d6.2
        for <phone-devel@vger.kernel.org>; Wed, 18 Mar 2026 02:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773827714; x=1774432514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VCCg5Y1x3Oc6Q7IA8Ya+WunadascikyR7lZZKozdkAk=;
        b=eWam8t4O0GlIav+Cxy5/KwQAur3Rm9zlXNeRNCanut+i5bkBukjISPdbi/PQEpH61H
         cqe9AZvotWatKgd2LI2rQ+G94gD3ZihAZLo5K5z4JaGr2kcwT0z25JRMPzK2LS1ZdymQ
         GxLRdz5vnill+lIvWEClY2oox3pl+H1Fil+N8L3nPQF9higvYm04Wvk5t4uvCk2CQjva
         LsksJ+8LtYXjx0MRLTOORhxOv2+M0YLavJw+Ud7IjNG7eJnjRiDnRT0zSGMrV6GTKWy7
         tHSGobRiqa79VVOzTlTJHKyNotOAQDD7KsQANEh+IgkyIFTlJyp/2wOR/Xh0uWNzU9nd
         vtmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773827714; x=1774432514;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VCCg5Y1x3Oc6Q7IA8Ya+WunadascikyR7lZZKozdkAk=;
        b=eBg/cmDnuCFF/WTH/rUeZ/vTCoGuvg3pgD4qkJ/PFukH5mS7n777uwvfYdLE02mMhz
         QozfB2Wdq2ptfiphTL+iz6wtibFaRH50JSgpHWze7qzQ57HXJRYE53Ghxp7+IW+lqmvp
         axu/p58HUTSrKRQAktfprIC2k9LiFltjwEg8ToP3im4UAq3yKyyz/1Fiqmol78PZebhW
         l0r49AQCVWI+/Jme8QJgW0KYpXkd9eYwA7ZbhmKYbNgLE6A04lpy1GwcE6zjl1RxuGDW
         DXfdigYN4Du4Yx/joYZVT+9qIR+Vm2x4N0lJ+/+K00Zq7G9Z5FzkkNqjtu6l9wv4gbWK
         9X1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXe2TUgc27ARRv8DB3cmQ9AvmEzwGX1YKMrhJmf4GYDMe/p46A+ysYyaGTqrXzxH/5hXNkMcutd/2ZRGw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzTwG5FU0K9me36+FGfyzz4KYqCpgkTbwpWAoyHOADrYmX0k0m
	qOegKzu3hMO7NJhL27reX2pMw6IdKMlik+OkAC9F9lYyQVDurJ2mKfLthmHRd00QYJL/HgeR6CF
	3BbtkeAW7M9GeUsbEViAvRy8HxcV7j/b9kIxkJS26XhltFIpdFuMg7vHpgEU78aPgaA==
X-Gm-Gg: ATEYQzzLG5e6ISjLfjXnL/LNnAVqzVM5w8998LrePDOViJF34ov0yuQ/U+nqBHFBnoV
	4tIjpRbc+mnD8Kzd2wDf9tvo1jIuawClfSPiUpeBDrGl+Pi/FCQqDa20qmRG/mRzgs9fE+XbOeA
	e8gdalPVchT4iScQNlnwi7pZvse0/YmOxCxkAEuKSyFD3GHDJ5RY91cPVKvwOwDpNui6u8zk6eO
	saHaGoETGTaWGzKSbfDvPnyc9xDiKZYRZVCvdAnzqDg+XxlgShwdeCIZhxP+QzCK7Qz7PxW/Ymo
	0G0wowpkDU804pJSCF3Zzegx9gshjIVghj+P2DorpupwMXOUAXc9bIOTw5aHmqA4IcN5oBOKvpI
	FfJbvAOjRP6Tb3p8o7Z9hiqZxVKP+Lw8u/JlCLShMvHFHNowP0k4Hxb3gYZFT6xWsS3jEVSK29c
	oy4Og=
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr24009451cf.8.1773827713794;
        Wed, 18 Mar 2026 02:55:13 -0700 (PDT)
X-Received: by 2002:ac8:7f4a:0:b0:509:2c6e:f6e0 with SMTP id d75a77b69052e-50b14906b2dmr24009301cf.8.1773827713408;
        Wed, 18 Mar 2026 02:55:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b97f144e53bsm170047266b.25.2026.03.18.02.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 02:55:12 -0700 (PDT)
Message-ID: <01b8fec5-527d-4de8-9915-f456e7bfebfd@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:55:10 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: milos: Add fastrpc nodes
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260306-milos-fastrpc-gpr-v1-0-893eb98869ce@fairphone.com>
 <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260306-milos-fastrpc-gpr-v1-1-893eb98869ce@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA4MyBTYWx0ZWRfX3sxOklB6wfFi
 nHj8OPEUi0rdGOecrhXjsL/miwoxsFmEU2RlLqNOTUfKgJcEfamyUPMcqR7hHX50yknp6EQdmO2
 kbS4id+MiV5J9d334YypALAAhZJj0kMsfXqkMsvGab8Bzqic4g91eJJZADfrs7e0KF1s0yw1de9
 e6EbieHtIAsbV84XJSTmUoYcGBcXP+WSgL0QFD3BceEmqtFu2Y3VYT8W8ibYcEaiEIsUgkcO8/K
 c27kAtXKBUi+nZ9XNnQ8EP084o2nh5lvrv0ml/HiV4RmCCyD492FlCA1kYQ/84iI9gheHOCzaHY
 71vKbi2PiuWB5kKwfHfVncSUXjsy7/ybgD3q0d8raZ1NxeuRd8Ugb0KYIk4NmI4Zc21iNfvkq01
 6C3KRelJG9NNEu8G/ER94eau9rTDZumyJdWhrCG9qqAjLzavtzq94Su1t3uoRtTp05Fz5W4kjc7
 UbWADj/BRYwN0gmT2yg==
X-Proofpoint-ORIG-GUID: __gMbCe1LzjuGg4GWswpEAfZE_jin0qY
X-Authority-Analysis: v=2.4 cv=H87WAuYi c=1 sm=1 tr=0 ts=69ba7682 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=WWQFUNGd85j635JlVwcA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: __gMbCe1LzjuGg4GWswpEAfZE_jin0qY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-18_01,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180083

On 3/6/26 3:01 PM, Luca Weiss wrote:
> Add fastrpc nodes for both ADSP and CDSP.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

