Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EEDF3CF021
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784535998; cv=none; b=MaqtuedP/AsC6GOnpBoCPikoB4qUn1IVkGMAdBnZqapykktN/7nNHgoCbrL0cEbmVKbqbOyXBwz2UHq2yZZb/T/ZeuFLJzhCxCEAZbglLkQHPdxTyVTdeutN+spw1iYlrlkSRpsBXh9OJi5OcGbSsb1B2J3bV1uOypOq1WTYtMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784535998; c=relaxed/simple;
	bh=GBF7KrHy3ln9XS/ee3pZ1AuSGTr1FRAzjvSsBHplr4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lYJep07Sh4W3RR9aSntWL7BNUAlBUEoVKygymOoVGZKt4sCuawj4ymON1Q4Q5YJbVyApgEZui2teeHLJ42YaAPBcEjzEY58YtwFOsUCrGVBcw0GrP5irWGNzuVofSBRPV0QcjlqfeV9CUkBwLN/l9rijCVhjnOIqLpSyY73nP1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pcg3ZrCN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j9bQg5nJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pcg3ZrCN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j9bQg5nJ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K6RjGw1713682
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:26:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=; b=pcg3ZrCNOs6Pi9EK
	2wMLBp4Xz/zRAuYQFmJMbg76lWP+FisAfhVcG93JAemwkL7E/bnAlupzIap3SF3y
	izdCeMP6H1dLj65/UjQIcsi/31tWJbRd5tmwILsBKm4CmmEJBlFUzXz6uqX6Obsw
	bdqJcVrVEckXIoMO63xQR4tRLnwHugGiJCelvKnS+2gDVasV23YezOZYsN5fJ1UR
	44hO9j3oMHKhngiIYtGzqDtjeqOPJ0Fp/Nkrdfu3R/IcOCl8jf5RPzZw6e8Zgd9M
	qA8qYqJomH/0ZMBV1DQ8vGlZHXUhCYq7kKUFYs0cwzCKN0z1VAsoKGps55oLKEVT
	kMYODw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2dc575s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 08:26:36 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51ca37ce4c3so19236651cf.3
        for <phone-devel@vger.kernel.org>; Mon, 20 Jul 2026 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784535996; x=1785140796; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=;
        b=j9bQg5nJdfzEcjr0UY2MvXKikT26UjKNyBnI8ze1rpS9JlQqYnxgFGT7Gqo9oOdT62
         D4vXF37xKJepqLzml8GLnNx8Svfj6HSG+6gRFdxE4XcU6GbP95+gHgT3z2Ig+SLuDJ3b
         MPoG9WGxdO96ZwxW6HuO75jc2zry4ElU7uLt1nAyVQz1CX+M0rpzIMkWC/pUoqrEaLLV
         Ks3rlLYahJebA/eY41L21ph9BW/mS4Mw4pcr5emtab5EjgiWI2AxZbSm3Tix/K78RrC1
         D7ImdIVTD9B70MRFJgmmlvqqfN+fGAdfyxVeL6zb/x7MbDGQaNOubZwSOxOslv/0HiY3
         A8Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784535996; x=1785140796;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=88mJyp6oMmmLpNQcFlo95mLCzBlwISYWWKmsfIRSYFQ=;
        b=MF7KbDUzaubrlh4ADegp2ZhP2TzlRm8pfg2iPO7meJNXBf35r7hsAmXwBqA8hgh6xP
         XpTuEUSCfF7EMBbBj5JhYhklp0K2GMQMnVGWMclPUsrQRPA5SeRvfc6HHapYsO3OcMdp
         oNR88/glSwhnH+v1x5Bhidkppg1CQNhy4Nv0fAFuAV00qj6JRBhxouGKbT/iEV1+c5nc
         JqzRSR+tGi9ATnALwmhN+NQh5ydk+6rPLvlP6LiYhvmE8ulILmfqk4YAQSQrZ410fsC+
         h0hThh5o5Jro4TCjW3tOtGCPG73Uk97jSB16PV4RiK2hdBextF5PqC7k7l34XMJyorcK
         dTnw==
X-Forwarded-Encrypted: i=1; AHgh+RpHgmjfdeI8jMopWNy/IZCFg0YDhM9/uKaABZ6hbVJgpujZiZarjRpfsvYqNJfOeLk9eRhsmkAvkU9new==@vger.kernel.org
X-Gm-Message-State: AOJu0YwOXNGO36zPpDQgY32zZrQA+jiaUkbIqMQuCYBp7ELXBiQU2olD
	Wqto5OEyKmA+ecxsB1WBeM0Vgu25Tsh8xhtaK9Du7iCqe2pfX1+HVZhO4LS2IB4KDhZWmbOWhJa
	/C4xaWdUkdLiQWyNtWC/U3qcEjT5po9xfyF2PA/ZglbQI3S20ZCgrAMGuE+6TVPl8lMAIxljpEQ
	==
X-Gm-Gg: AfdE7cmqjkMEW05Z1hv9bEMX2Z7raEDSiH4PFbsk8O9csPAFiMseTDDH0ART93V0JHm
	xNsutvTATNMwXE3RTKk4aq+9VELZyfsFfNy2DPKtHospvQhiE472l/Ft88GTCEREpXfW1vJkn2K
	F8OTgCGB8t8Aydh3rNyrLXwmzaUS3lJkCSn/jVRnwBZrBufxQytqpOBJtACVZ6JNxnDfgSk7XLa
	01q+q8oaq69CsqaosdrNWbwiQiQphNV7LoUZ7ULc5/fHh2n6boRnvD38/VJb8f4HBXsrjqgtm5E
	jv/+yn1uW5QVFt261gQq0zdXnoaRCYYbhn8xp08LuUScn1kxFcs0cGg2J6+Hys/vgwR3yK9PJr2
	iCRzWAAVzosHGt6vCpggAbPaV
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr77968531cf.5.1784535995664;
        Mon, 20 Jul 2026 01:26:35 -0700 (PDT)
X-Received: by 2002:a05:622a:6848:10b0:51c:1c73:51a6 with SMTP id d75a77b69052e-5213bc1dffemr77968451cf.5.1784535995230;
        Mon, 20 Jul 2026 01:26:35 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c17009adfdcsm415561566b.4.2026.07.20.01.26.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 01:26:34 -0700 (PDT)
Message-ID: <acc0280e-248b-44b8-9300-86dd32b8f160@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 10:26:32 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/2] arm64: dts: qcom: sdm845-google: Enable PMI8998
 camera flash LEDs
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>,
        Richard Acayan <mailingradian@gmail.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260719-pixel3-camera-v5-0-99593f1bd8ec@ixit.cz>
 <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260719-pixel3-camera-v5-2-99593f1bd8ec@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX3qCPF6hr/skD
 a0yxvvsEaESb1Y4BjQJlXVKyvw38yo7uBEMUIO1YIkjBXRy8/fyuJPC28W0d63TBdYbbgE/HEa/
 A9M+hIWmDD/vU5SDRVufceTifg6hHx4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDA5MyBTYWx0ZWRfX+sno2D2JsBwG
 k5ve9k8braIPMqCwkfVihsobgpMF91Ed5ozHF6wnWuxO6g/ljJSm19SNwu2XCJ3dLrgpLhsK5b2
 XiCzTN4fo3+B8QbyHLPn4bGocMpQrqiUACA+eX7ZfJ5Ot5PjSo8b9FpWRX7HPtmup8pOaEtKcIm
 vFXbOF4nABr6Vpl8fj+yvA2OKCu/O9f2b0GIZ3OaXzVRs9/sQPkqeZSvwjTEJMBS3dIGYXim/4b
 aiPJRua4H9ErTiRLiiH8rqf5yUsEQ5QvcwCix5LVYyVT/dnpk1AEblazJYvRV654ZLkTZyltFHw
 Nd4B/r7LCAnkNGtYKEBha5bJXeLx2K2pNeO2BpiVk1W2zVhcoEPTmM7dLDwBwqak6volj5U1ROv
 scAsSBc4Ng7mUbQ+Zd1A75Q8W+D8qIfyayx4UwEp31maqiohIWdc6/2BC4nKBv7r3Moahj9/9fW
 eHj55i/8PTvd+gOMiGQ==
X-Proofpoint-ORIG-GUID: WOE2kTs6Z-0TumgsQC7xcy-X7qR_Qids
X-Proofpoint-GUID: WOE2kTs6Z-0TumgsQC7xcy-X7qR_Qids
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a5ddbbc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=TWkwOYXMJnNHLyErFSkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607200093

On 7/19/26 8:03 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Enable the PMI8998 flash LED block and describe two white flash LEDs
> used for the rear camera.
> 
> Configure the LED in flash mode with hardware limits matching the
> original device configuration, including maximum current and timeout.
> 
> In contrary to downstream, we can control both LEDs separately.

Progress!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
