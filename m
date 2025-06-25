Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCD925D552
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750852282; cv=none; b=Uw6ZiFuq7yDWoDXb//EqpsP6mngkIw9aFVoQWv9wNmZdld1KQZBAcKJcni7QuQdHzLer4Drh3gM5OTGurE7WRX4JzDf4vz3bvcE+m8AkRqm+yeJkqwm6fxrOCHCKPLxUkULkfxBoDqzXGBBsYc6VDkIVT+kmc1b1TZqKCYhzepg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750852282; c=relaxed/simple;
	bh=fs7c8Qyu5BrfvUyh4WP843ByKBeqVCKxGmA3+fES+jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j0Gte3oewKolRnnC687wp+/URJXU3SjoIRQ2sW17nTAnIwaBsxSWUXxYziM8KFmMXmnnibFEDRk/LYIAMMcsPBPz0S6QogHa6u2lhBMLNUsSncYRIVmzrHVPypyoUO/ELlRdXAVy3FcEDOlzQxTPwQB6TbZJGg5efRr6EaEu8m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ej0LtvTJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ej0LtvTJ"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PBGtAu005909
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uRfQCMJPJ6I6xt/lsb5RiX86zBh0KuNZA9Flm5VJRyQ=; b=Ej0LtvTJLh+M6FeV
	IpxDKqLh59EosLSa0ArOiC/IdoB5oFywQQSaMN9UOAu+528/6cOO+3HkHRWcx+eZ
	0jT0JNFfqT3nwlmkII6vBB25GITh5GOGzuM/WCmOwHtibkfQ2fVELQC/mlsWdLN9
	wkBi8SHN6I7tMUPFT/FScHUJp0NCJqQ7qTiekP6jqlq63IzQjIV9kP6letvWDmdR
	03MPl4ft6GCNb+F+ofB1DWHx9fJ2fyE9zKg5OHpljk7vS5DqcgRGwaT+DEQJIW8x
	iFwpIiDYVIlIugDWxa5VqsufcYATT7Df8Wp/sDHjUzJEk8M0JQcmvwvVk5ls0vhZ
	qOVP4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgfrux-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 11:51:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d097083cc3so181878085a.3
        for <phone-devel@vger.kernel.org>; Wed, 25 Jun 2025 04:51:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750852279; x=1751457079;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRfQCMJPJ6I6xt/lsb5RiX86zBh0KuNZA9Flm5VJRyQ=;
        b=SYGC58aq1cUScBHI2QHArs9cceTcs/ebd1U23LEAfzygn9Nq3Q42Ty6k8PtffYSwzg
         FATMPb88rPyY3mN0gP0odukPw1UDMBWO9Jv/RsYhq1X3uwR5GDI2yysUWsIiB7rQN4km
         nfttl3ZG5izeGnE6tZQ7zs7X6uKb87LI8Pw8rn5J6RLJObtg/k1yU0hRUFGRgR4YtKzT
         9hRGmLJ1YPNZIyB5Ahync7aqS/lt0hop/E8leJHeUUsM5NODUx7Ml8FmZV0ctR9VhmLo
         8SZgeaf010jQYjgOdWbFIdgrjdbC3ssyXlsI3OEGbcIq+GV4YWXDx2eEw7vtvPkMXrT1
         MgIw==
X-Forwarded-Encrypted: i=1; AJvYcCXNTkrbrTpxySZLjDiyfoRZxeS308JEciErDWhYW+PVDapCEYxiIRl5qHNzZMEN0OB5wRB4uMY8fEysnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5IfcJtvjPmCtr+8Sd0qsQwg+cJPUAcqL1gM3XfWbkGcFAwZ/X
	renwLxfCm1RxN13poHoxjG7i29wye2TkDnlv3Whu+DRN6UNuE/zWZKMq78fnifc7o1HjL8XpOIa
	qNHJtvrXE8bF7CiAFAp4EY9FCVs9W+zxxIqHfDt3fT92DXc/VMxwiZL5zzsMX+zmGfQ==
X-Gm-Gg: ASbGncuN4r93w8lDRomStBRxRiVH52hqPWEP/ptuM74IrqvNzlqT8pCPf6mWHmPGRpE
	IcXxvJ23rDY7vBPedQPFfjnVwFwY5P7mresOlZgw/no1NoSX0+difNvNrXQ2fsSY17CUHPO6Wiy
	Nfv6MvHAkWR/qVVLTN8QN4hSLoLbpDcXl4mUvc/NGoCuUWgsbNmHKT/d+XfUTyqe2/xMRQlIHDi
	5xDSU3UfV19Yt8hhvQmQfQwT66ljcKPHwW8S1ciO0nzDc9e5aKzssU7T+yV35ustE3q4AoY3RFM
	6d7mpjqIFhbOu6peezj1Z4gQ9TcxYmPwihWnpKj5gnDGSY4juucpKDV4KQ88208j888Ardo8W4X
	Br5k=
X-Received: by 2002:a05:620a:4802:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d42973e679mr128603985a.12.1750852279224;
        Wed, 25 Jun 2025 04:51:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHccfvELeUXoP8b1jBpiU9AZeQNg48frmRiDDZy9qYIkV5bzxU9h6vBSLu6n9Ur83kyw9tsMQ==
X-Received: by 2002:a05:620a:4802:b0:7c5:8f36:fbeb with SMTP id af79cd13be357-7d42973e679mr128601585a.12.1750852278731;
        Wed, 25 Jun 2025 04:51:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f485d0asm2360299a12.64.2025.06.25.04.51.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 04:51:18 -0700 (PDT)
Message-ID: <4d215791-35da-4139-9cc8-33da5d46469e@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 13:51:15 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] phy: qcom: phy-qcom-snps-eusb2: Add missing write
 from init sequence
To: Luca Weiss <luca.weiss@fairphone.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
 <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-3-94d76e0667c1@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: i3PgwVU2yRHzXexky1ZUZHYXbE57aPQX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA4OCBTYWx0ZWRfXwwJNLZxKPdTn
 Vx/h3c1UawzDG6cNpUlFqM5X17sA92N4Dn6EugeMu21bzhSsqgmFqphC3ILHp5/T6QrcX8tOkvx
 LvBoEAnPX079ZV/b9XdFX+ZRrKJkSCVOoAGbXjhEHW7hXHPbnNa+bdsuH6BlpFE2kT0bEVxIHPZ
 XkRY8n3MSBb1VSf1efC/BhNm83XvXyBqyam4chn0Yoj2lumt9gAyn1GYkdIPTXKH45nHMTT3XW2
 fdWqRqGbaoyC/Pez5dKt+9sWYApI8YfdKeAkkiMDpQSwVl9k+KQ+Y3uaKL3KyJ4Q2rx3TMByZIp
 kSwXHF6bD3AzqwI/eOTBTM8q44/zG6mifiLwD8J5P0pFNxpPZRPDMWQ9dXLgCRsi+OL9xe/oVsI
 gH+pvIqRxUYsn5T23Sr5a9tjoZnyZQMEHwP2nzxy/zOY0Zx6tqW8JiTQoBoiXxyI4/BjutXF
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685be2b8 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=qC_FGOx9AAAA:8 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=SHKt8ETI8ElOVTnc0VsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=fsdK_YakeE02zTmptMdW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: i3PgwVU2yRHzXexky1ZUZHYXbE57aPQX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_03,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250088

On 6/25/25 11:14 AM, Luca Weiss wrote:
> As per a commit from Qualcomm's downstream 6.1 kernel[0], the init
> sequence is missing writing 0x00 to USB_PHY_CFG0 at the end, as per the
> 'latest' HPG revision (as of November 2023).
> 
> [0] https://git.codelinaro.org/clo/la/kernel/qcom/-/commit/b77774a89e3fda3246e09dd39e16e2ab43cd1329
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Both the original and your commit messages are slightly misleading, the
HPG (and the code which is indeed in sync with it after the change is
made) only sets the value of 0 to BIT(1), a.k.a. CMN_CTRL_OVERRIDE_EN.
You most definitely don't want to set the entire register to 0.

With that fixed:

Fixes: 80090810f5d3 ("phy: qcom: Add QCOM SNPS eUSB2 driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
