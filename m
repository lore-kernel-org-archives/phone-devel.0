Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0012147EF
	for <phone-devel@vger.kernel.org>; Thu,  9 Oct 2025 14:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760021195; cv=none; b=iNPtz/BPb+TeLVShOOIOkCgYKgMPxXOsTCOiTfmrDz6WRVDf4lIIAwU0iAFvLBNj0+oyi6K/qXTHwc24LPb9eo5PAGMdeKhYxXlImdfZ8um3qTlDtNDEE9/Ch+qSvGB58Y7VDb/aMX909iCGx4wtteJ/G8k+iFITrWpcKoL+UDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760021195; c=relaxed/simple;
	bh=HCVYg7YLF1NRKPfftTczIu52IvG4diO/x2IeTxseCjk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KM2pCN0CP4BATlXo60/YbdW0Ns13mMxpv7tEw5HVmv0Tr9vd4e4n5W477Kz8MtSkPmKQxlqgSttGu6N047rqx7F49FCRrIum50MAoHp1HZps6S6G+Ls+ufqFfp3N5raMl48P3FYpJr6cuQ6eW5/VHGoPqb4aMUwrosYypL4p/SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AuDIsEqN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AuDIsEqN"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 599Ebc2A029641
	for <phone-devel@vger.kernel.org>; Thu, 9 Oct 2025 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HCVYg7YLF1NRKPfftTczIu52IvG4diO/x2IeTxseCjk=; b=AuDIsEqN3HKUd6bh
	3IaPolLJ6PiAMVZuDNDzcoAtaIxDGUmQ5VFei1tlX+usRQ1mM0csGHt7pkOdwIx3
	+h10kRLQmncyg6/J3DSk+LGldv9A1x5jDc62nweQf4LdWX6rAKCRtulOYV6RcHLP
	ag4qDkmVnXvJGsKmY90SEXooR1HGn8pZ0oAbjoZjw/dTvc9qyDfrzc9uaGmDaeQM
	2lpY22+mczkEQNQ9Fd1o4+2RR4qoukb2zeCfnkYIhiqi7xBc0y7opCTeD0dOKeM7
	/BZ14GTrgkyhwzjLyW2ZIlTiiY0KxrT+URGnWflOL5I+/J2uYwWOtsVVXqURQ6lv
	xgYZ1A==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ku98x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 14:46:33 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-879fa4a2989so2892576d6.3
        for <phone-devel@vger.kernel.org>; Thu, 09 Oct 2025 07:46:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760021192; x=1760625992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCVYg7YLF1NRKPfftTczIu52IvG4diO/x2IeTxseCjk=;
        b=Yi0Ec1E5fSrUdB/XPwpGA8nAc8ijk1ced+pvdGLPDKap0DWGZ5fmm+1jfOyccd777G
         v9+kX7Cz1gVQQS4aAW+/h6gr5Sxtx8bHEErUjEGcNrBZITLvwvDSkVYsff7guDSnjT9t
         g0nvF/XF4wAhfqxp7o4/k6keJW3VgLLcG12Qz1PI/O0q3bCB+id0EIT4Onuj241fCawF
         YW9o1qNji4fACv1tzErNQABh6RcVCHCeGd35umewN/RJDhEmBvv1N0QNHBRJzllDdSXN
         l26tXegANBP2NF+X8G2Eg9rW3R+KBuUNguckW2HoV92QA5j/M6ynA1qcH+DGYk5DVLdg
         vHrg==
X-Forwarded-Encrypted: i=1; AJvYcCWCY1xL3jXGdsON88lJxXnv+Qa7eFw9o0zNhiZ6eKTxCB8dqOXMmFi8zsDp7Hfv5VO21pV4pyB0rO1Xew==@vger.kernel.org
X-Gm-Message-State: AOJu0YzPsgRWljuC2i6dk99ifDrGaR5SkBwwV6Ob+BE9T4m079rzJyZE
	bawI3FW2QW0+962xkuID6Q4ILla7yUDjgJvSBS1UKppaNSmwQQQLr5zGAaQ/lNB+1cS4AeMPxNP
	vBzkhvilfI3i1+zIZinpDqp6wtKwyLVB5kl9jvbnhMTDqblnMpmQxVA7Nb1GT0stv8g==
X-Gm-Gg: ASbGncsN6OWlUdZ2TOUjFGoBOKWpS86uoBcP7R1Km+uUqL359ThLTRNRMvqhKaK+U5e
	CMm35sTuJVU8YeKhOz9Ss2/mHv4R4iahxoxy9d8A65DByOVtdhLh5MCkKBO78vuk/j+oA7iI3AN
	qculuoYv4h2APiberO/QUT8/7+Et7q0Xgx7wTBmjfvQ1G/bowW0ahocCqw4RIe2WouHZbTN8RVL
	muhYGVw47Y8kfibJptBcoa3c/8p7DWbKBtU8e6SytxhUTSYTUS4OEnMmwCjDRUE7ebWtVnnJhDQ
	onsbKhyRFvPa4mGiicIfcONEVYS1aaodjojLZyiECwImgbdy4O+paQei8qzogTsbLTIedV8qsxz
	6OTKtzOs6qDAixVOaxZ+CR9YFXsc=
X-Received: by 2002:a05:6214:1c89:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87b2ef9394bmr70623636d6.6.1760021191407;
        Thu, 09 Oct 2025 07:46:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbkxsgpA2R6ZHZIpuug3KaY9J4Jw9+efaGwspf70reNmliHQ6JBJOzAn8d48ngP1fI+sY3xw==
X-Received: by 2002:a05:6214:1c89:b0:7d0:8b28:aaa4 with SMTP id 6a1803df08f44-87b2ef9394bmr70621816d6.6.1760021187635;
        Thu, 09 Oct 2025 07:46:27 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639f30d51c7sm2578021a12.11.2025.10.09.07.46.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 07:46:26 -0700 (PDT)
Message-ID: <045401ef-3a39-4b65-9874-0a0086e72325@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 16:46:24 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: qcm6490-shift-otter: Enable RGB
 LED
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Casey Connolly <casey.connolly@linaro.org>,
        Alexander Martinz <amartinz@shiftphones.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Luca Weiss <luca@lucaweiss.eu>
References: <20251009-otter-further-bringup-v2-0-5bb2f4a02cea@fairphone.com>
 <20251009-otter-further-bringup-v2-5-5bb2f4a02cea@fairphone.com>
 <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <rnlkxpm6crulpvfleclkszio2fms7t3ulc3rpsdozteml2bak2@zvfuyc33ohez>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX24jZDtZtSjRT
 oCKpvVQADrhZTBe7Uty8+x2autqF/6CfxymNwKPUxMAkYnXHP76m9W1AaWz2EJNfs8a9ozJdi8M
 TIPxLe4qSwNvBTZsxUi8YK1SGQhOD7w5f6e2BDmc5btiEEdjnZ/btLHgzP4/nNDxjIoNJxk0INy
 2gCLyvvTNaXEy7FOmSaZJVPQJrmNi/zzSKJl4MbMueGDP62l9hRB4Hs8PJRjy9FlGGMn5ktzfzL
 msIhErGb3dBM0a+2Hxb6F7Bj2Qf1ZyMD3S2dOHBflHV/j3AwdfLC9yRXZ7ZOj+SY8h51nBu+xjU
 rkpEUkHwC2eI88xm6qqxxw9dVrE/2CmanIs3BSz6P/MctVooN3aY/SbUIikGKU8lFnsEkBSwToq
 JllfRAg4c8sjLg9Q0uHC/Pv0vX8A6A==
X-Authority-Analysis: v=2.4 cv=CbcFJbrl c=1 sm=1 tr=0 ts=68e7cac9 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=6H0WHjuAAAAA:8 a=h-s2VQCXUef8IyaNg1wA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=y4cfut4LVr_MrANMpYTh:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: y7IgIvWjbFUHX9Ce4rCD9uEYr3dRD4W0
X-Proofpoint-ORIG-GUID: y7IgIvWjbFUHX9Ce4rCD9uEYr3dRD4W0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121

On 10/9/25 4:42 PM, Dmitry Baryshkov wrote:
> On Thu, Oct 09, 2025 at 11:06:35AM +0200, Luca Weiss wrote:
>> From: Luca Weiss <luca@lucaweiss.eu>
>>
>> Enable the RGB LED connected to the PM7350C (PM8350C).
>>
>> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---

(you sent an empty email, Dmitry)

Konrad
