Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B95F3195EF
	for <phone-devel@vger.kernel.org>; Wed,  6 May 2026 09:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778059007; cv=none; b=DJdZYjFn/j/GFIMBK/cEOxNb5tEJUpsbHkKjFMq0Umo7oMW5fUqB4mTbAuxh7zc6piMljXiOLM1zkZXxjJ9PU7077m3J0vhvlriOxBldPWktWBvVhlt66qEKrnxf7NzHI+G4W/FJmtHswONlCnlq7irbvxxRE/5hAF3nmnVTB74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778059007; c=relaxed/simple;
	bh=TxvTfFjdfnWw22HuuKIr2gOK1ckKyCbWP3NkBT75F6Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE3TBXXQy/ix+wQdSEB3V3Y36E0+zg70Dwj1fr7M1JIol9aeZDHyYN+uSxhjF0h2L8f9DauEDl6yK+g3qO63fElBVc0iDMv8gNuW8S82/OU7Dv/cfmVrPiwFO2vy8gG9NCt6PITD8dc82MUnGgRqKTFe6ktObAQblMdHlEBvQ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JLLzx4Pn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhjGxZg7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JLLzx4Pn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhjGxZg7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6467CfZh1527930
	for <phone-devel@vger.kernel.org>; Wed, 6 May 2026 09:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=; b=JLLzx4PnW6pOrvFR
	nhE3BxVN/vnR5FjtQzI5gQmMFt2zWL1FxaIapcex5nnLc0hPIgXwDlB4R4B4HZCZ
	/Bf+JBWCVpxsdZFmvenMz+DeFFFg2rdwX8/BLVbbHnLQF4FEpr67DRLPqz2DThJc
	+Y183fBUwQ3m8kLh7q5a6yRBICo1O2ZNjLzF7Wp3uS0y4rT9RsjKP4LfrAhvXouj
	jn5B1xkGwiYpRiTxizuCr1B3Mka6mtnQPVHitWAfgtaOJABgy3hcpI9ULp/jMCR4
	4KN7w1yw3vMKbCA60RarKwolQvtRKcvmigM1u6Es8sQadAIGVgYdDtnVVTd5CGzP
	V2FEpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e01288j4j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 06 May 2026 09:16:44 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50fb98b09d3so21881391cf.2
        for <phone-devel@vger.kernel.org>; Wed, 06 May 2026 02:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778059004; x=1778663804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=;
        b=YhjGxZg7sugr+u34uu0nMShBNbdyc6hcp+z/TLip6hMjuC1j9zWLGyHoI9M3I9L/z+
         G+qpNEw7bRvXFiEw/9AlyNVu9/5LlAP8qRd78sh9D8zHU3KBEkCO8BNp/0ekC7cYBJzs
         0e5/MTly2IdseNXZUGIbPmGZ0xolmMO00HqR7h+Mewl0Oc/8NsThDE7GSqIzz05xoybJ
         /lA2vWgwSrFQPJEuHf1NMQeDQC1X8q1LuoUfsdtiCCvrAG1HgJ6GLM6Kj6Kx+l4wEX+B
         A6x84sRA6IexQENkCqwN/lx0b8QsIuJLIYXTB/hjgUJIWyP8lhzlD37RpY6RGT8W2Hmo
         zhcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778059004; x=1778663804;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CzRiVjL31AN/PgDXAgb4WIG82Qr4tgLanNDX7Fm883w=;
        b=WVABOeR6FNyXioGnWOBN1l8J2y3dlOqXrQb/rhL8DhObptJ65zJxemVU28F72yPCjk
         HNgrOdd2Nm8vBaP5CgqF9gWGMV2JnSZL2tATspVyjGocn/fb5zVzoHUVBXcD6uADcrHj
         Quuqgdi6aQjXYRr9x4RzMuEpKQs/TzDJK4PpPl73rarIxIkf/cNpE+7CHEw6lZekggBO
         EQHfMMZt4NuGyFjxDv34qcinn8hdIXe1e95MMGF7II5lnk2NnV6R4/d4lHQBEUaB8xuM
         Wyl8YqtuSIYkJUPp9pMyM8a6aJNA7nphxmPKNYSj0VY42o2WruOWMOpj41oBZmHdgCUD
         Jgxg==
X-Forwarded-Encrypted: i=1; AFNElJ8KwmoM1Q/uF2bcc4qSNpg1GMNeE49dELNArX6fm9FSLhmOHW1D0AVP3M9zq08spgQTKRWibmCIxU1lSA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwgkJUVx4oiJ+kCU3R925ldt/cgL0R8CBKtKDEROxmnjzkbrUiL
	xJrTnmDrbPp3Zowd1q1Dxq1yk0tOMMsKjsk8x0wHIy1L9THzmbrHEH9XBFnlYBHa5hWMy941IgD
	BxoW97XRYUBgt3GjfVxMIUAs77vJxnbtEWBiO/M6w3wI7J0sv/l5t3tUkBO7nD+mY7A==
X-Gm-Gg: AeBDievyteopnVsuYLLK2TdDKyKdK6dhYaxL/v9pFcfzEQ84kj4DzvMvMjM6NBmntej
	sNzxOH+L3/33zCD1pvicgC7XxUaBLf7GDRXmvtdC243kSGo9Ud9rYzqeKXgMSj41Tz/LxDLCoeV
	/LVBvvR2/GUN96WsKrgCZ6InWbH1U/Ds4hJ5XiRWCUb+gSQdA9E0TNkKZ4gDu/mBjPd1slF4QNS
	30rS4/6Y0op+l+d9pStOwZJ3x57qejnWQRmoNjGbx15fT/MulY5xbBlYzzxdF9l/5M19PENmr63
	X50kbZqSxvmOJnxhkHYUIaSSeRduGtgurquaBxAs6gfvLhoCrFVaKCvXcNP4syHlrolx1oey0bf
	5JX1/r1D3j+Q5CZPyEH1YKq8rKFlQDTJWZqvVR3IIiQicyoA+m8lQCXxV3IJWd2V2toEzmLjVwZ
	S/IOoe9spATpEdMw==
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr25148381cf.5.1778059004354;
        Wed, 06 May 2026 02:16:44 -0700 (PDT)
X-Received: by 2002:ac8:7d47:0:b0:509:e68:22cb with SMTP id d75a77b69052e-514628b1019mr25148091cf.5.1778059003960;
        Wed, 06 May 2026 02:16:43 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67cd90e1aa3sm1048006a12.2.2026.05.06.02.16.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 May 2026 02:16:43 -0700 (PDT)
Message-ID: <feda9202-cded-4025-a5fa-36dda8f23dce@oss.qualcomm.com>
Date: Wed, 6 May 2026 11:16:41 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sm6350: Add PIL info region
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Luca Weiss <luca@lucaweiss.eu>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260505-sm6350-misc-v1-0-0b9efc22690c@fairphone.com>
 <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260505-sm6350-misc-v1-2-0b9efc22690c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: lbf__QB06-teceZnQmf5YRX4LmWm5vzH
X-Proofpoint-ORIG-GUID: lbf__QB06-teceZnQmf5YRX4LmWm5vzH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDA5MCBTYWx0ZWRfX7fFoK9by8Byp
 orfV9s70epWVUoFqOVSo212S/Nvtxyfhl8TewnaLSkN3FCNwd2gvLx46I26PmS+p1DaV96Eo41N
 h6xnyNFfFqyVhkK95YcoxdeqqpYlCoVy55gihNwwiFJ/kZPqVb9bTPOnfnW9lfmEdNFyEsMoA42
 KjER3awJQUy4M+n9WgNn+YmY8GgfbjWG6ZUzG3FMVpBIhfew6cgRLIIVLKQVfdtg9oQ5Z3guvJP
 +PFk83mmiRrxUcw6gE4EGhumXLq/wTS6iq9dB5huCk7xPBVjAlE1wyDKQZPa3FvXmKA0rcNahXj
 g8RZCgbGeg3IwxazchOONgH2ptbncT/JNxq77EEJGOMZh9nz/3HuM50bTovs9GWN8JuLCi8DnCl
 7JswXNaVd+FVSElYi93K2tNZKceJpMzKGHN2GQYl/PfYtMPSr+VeoRcQLnAx+wDIO5hZcpJlWqa
 V1aUM/Q9VCA1piBnbhQ==
X-Authority-Analysis: v=2.4 cv=A8xc+aWG c=1 sm=1 tr=0 ts=69fb06fc cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=cK09vydtsKC2F0QeqMEA:9 a=QEXdDO2ut3YA:10
 a=AYr37p2UDEkA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605060090

On 5/5/26 5:08 PM, Luca Weiss wrote:
> Define the PIL relocation info region, so that post mortem tools will be
> able to locate the loaded remoteprocs.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

