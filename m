Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC8D328248
	for <phone-devel@vger.kernel.org>; Fri,  5 Dec 2025 09:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764927802; cv=none; b=TiO0fPMMwKN3IjovVx0t5zD1ZpOrFckPSdrfEz12kZFjQ7hqsGS+hmROCWQPPE5b0q7QeqnpQABvYzOg4IkPRvsQtmVUlPCbuxiJdt93DV+qQbMNbS8u7nQxFCBPxCnqySCbCYj2w41PAmS6VDNKFUHdX1YaNWpZsd7tOfJCMYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764927802; c=relaxed/simple;
	bh=1Dtjn/s+S6Phy//fdwQyXqaw9wMZ7QcYaRMSJ3fhAbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGbapGK1ke04iCRvKxEu5+UM2YsFreohXk40PnW1Dynn1GLBUQ/4EhxGpUBtInxJGW35idgkKpZQpic5dpoEN5Z/sxIOfodBMSQXY4uhEevedX0eSt9iEMHaTDHxvDJn7k876D7yLWpcFPi78vIQT/0iOptrwKy4HQyW2e5QiOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hiv7ifi9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iQ3qSePG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hiv7ifi9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iQ3qSePG"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B525Q2w3135822
	for <phone-devel@vger.kernel.org>; Fri, 5 Dec 2025 09:43:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=; b=Hiv7ifi9lGDpNtur
	gq2NlUeAinhoE8WqF2rdgDRthwpdZzK9Rq/sVH5+dhhVrbvNL7ZunBqYxxH+f+pU
	97mRCgoM1EmuMa2Bcc+RBd1D5rD5+AnJGjIN44Gw0fhTd6hh5aLx0bVKm6M7O8Bq
	YqyNPLP4hBlrsNIP0aZ1WT3ZvRzH+qoRWGb8ZW8ay4yWzpiVamW0KbeJpUufnBVV
	2tKr3NcNopQcrOcfqLsNLlCQhs0DV0mTUmI7e3Ni2XuCw+aThxmcYu01jhlHKK70
	Dnjr3fkK0dk5d+IOOOmSxtIBTdFLsgE+xlA8DhaMZpuklslsxbfU0CWghYRxE6X4
	ZVM1NQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aupa8s4hj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 09:43:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-88820c4d03aso5180166d6.2
        for <phone-devel@vger.kernel.org>; Fri, 05 Dec 2025 01:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764927794; x=1765532594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=;
        b=iQ3qSePGJPXM1OpDctVmQSn8ovN05AY8dSyrluKwBmqQ2pJmRuyZ+zVCqjKtc36pWy
         ocGVdZbyYvigvLQ6M0fSK6t4cPR+36U1gX2jtw4LWB+vT5uc3j7z0iQX7ChJu9WRjX47
         Tj5Bgn8TWVfLzJOcxnpCAVtEMjswv7aVytNT89Pr5XTse/4FPFMC+fUXP+3w/s5YlHOl
         eM3jFlu8idyHv5N3lERXeYIrJNm5PwfCa/+/ARV9GuORW4fnn3UahDfrvXw/YPMQy0L9
         7TtEHHJ5/ixPYfE/Q7C485Z4GlIstdvYA0EFFswDujB0RBGC22Kl2oiStNunnKKn6JL9
         fjJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764927794; x=1765532594;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=051Y9IVu26emFyHODILoIGxYykNYI0ydzB1GW1bIHzg=;
        b=O8u6rbAedU86L2Mbp6LCW6cM6ozrutw8+6Vqq9OgoHr/prp3i1PDEM6FNISNxXiXKY
         V+DaYkr1yMEQMEor1HHv4WPxI/GkGTszXk4deatrggewdpaZo09evDU1m9nUyib4l7Jv
         3mBTGvkuMrJpHugrvYnUkgXTliZHAowciEyziAsFvY892FldxAqyi8TZ65P2iDEqqTri
         vVDnY+ZuHxuMeZcF7vXE7cKQNdlOkbJOX07s1MEfeu3TFzX0Gyg/JUGJ8t/NP1mYklWE
         2oSHBkA+IbRamfi1ViEG/mKavqXW1jN9o13GODnz/hp4sGa241rOQ1+sYtLPfW2/eiEN
         +ieA==
X-Forwarded-Encrypted: i=1; AJvYcCUG9JwmKqp1fy1gBUwrdXhGjm7RAb3ct3ismmnQywwDVYdPrRazmZVVcjhHeHrwvr/zHhWM0P/Fq/Q9RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2aHeQskhRy0PYVCvln/gkfVsZ885xEWzmyOmqK4aBQ06zORvt
	AA7uCBxWZO19um9SQ0nvVZzNLeqjQ8XdJF/utBrfBsZyvvPfL7j4bjPgIRUNvgmgCGQl79i4NG0
	LRqhxZHxi6vl1wMRwuRd6B/HPEzwZh5uwX6XJngoIcs/ekvW8iUDqF8S9YVCDOu7xyA==
X-Gm-Gg: ASbGncsGDATSnkH5x5cv3yMa+uNjqNTGW7ex1T3VJ7/W+eg/u6SyhycusCh0bG9UDxc
	YefYNO/sjkB726HDyNdGe8v2Lxccomx8lI6PLc7FqHhzGGrtqkc5fFr5Pk+PlJ9HNHdyfbRXB9Y
	rkFbQzUB3zSxmz2W/faS6D4EMRuPLl5+6fb4IOMDAqg6h+Nwqrrk/CzbySWugsQsNW3hWUtM7fL
	2dWoFXXp9riC+N5ir4Bik/slLP5iKD8ZUV0ZVRL4yKmbfZq3mKDjeycuKo9fh6hew5HltF7+l3R
	U+6pBV7w4GISFBjIEBzh7O/oDYAjU2wRSfWd8eFtwUPcmxRRwuxrGD1gOKVOaS+Nz8xcOZi6aiX
	WLXgrUC94yHjOsilsAWK2kevvKI1Cfg6o9erd+R2m1mU1C8/WCuExvYpxuxKvbtVzRA==
X-Received: by 2002:a05:6214:401:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8881d8519aamr104391216d6.7.1764927793875;
        Fri, 05 Dec 2025 01:43:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE00PIHFiV3/tKHkvG/O7NMn8xXqMnCgGo5KoqDYRTk+K+AnVBCSbZOXWXZ68Sp48OzMKygug==
X-Received: by 2002:a05:6214:401:b0:880:4954:6af5 with SMTP id 6a1803df08f44-8881d8519aamr104390936d6.7.1764927793472;
        Fri, 05 Dec 2025 01:43:13 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7b1a7c5sm1350921e87.11.2025.12.05.01.43.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 01:43:12 -0800 (PST)
Message-ID: <9af39b45-581b-4e25-8ab9-19015f00d6bc@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 10:43:09 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
To: david@ixit.cz, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Petr Hodina <phodina@protonmail.com>,
        Casey Connolly <casey.connolly@linaro.org>,
        "Dr. Git" <drgitx@gmail.com>
Cc: Joel Selvaraj <foss@joelselvaraj.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251204-qcom-cphy-v2-0-6b35ef8b071e@ixit.cz>
 <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204-qcom-cphy-v2-3-6b35ef8b071e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ZqDg6t7G c=1 sm=1 tr=0 ts=6932a932 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QkNP4qxLxUHCfFU9Qr0A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA3MCBTYWx0ZWRfX22DNbkBFlxXg
 7mOrKyuGhn4vgB4Xs2Q08BDS/0mybn2YkNJFCvjH+dYhN1jMol/VfrvArWZGjIYa9BEHEOsIVE9
 1R9oZwtHBOtkPWCJEXpmLCJs3Tlr6b8mgUemn4PrYKMEKBPy7UFV8lkFutmaZT2k3piVnFaztxO
 D4RjJplp4XHlk8m7g90rjQcBORSO6i/rhJ+t6SCRvE846jDvlEY+MFfCY/uG+5W8sZ62YRA0YA7
 I2dldMiganmPkoYUzki5MNHn08jJR0LjO9RSTUuQbQKYO+M3Tyx0j+CBx8VKErQpkZ6XkIaWgvl
 iHLBnnIY4n5e0vaN6D+S0IpY2lh+FD71LtxVgb4/PtRddOHbEgaLTHrId42Er1afn2AiNWn7NYr
 Mc+62hFzw8luLCyQiCxR2JGINXGA+w==
X-Proofpoint-ORIG-GUID: f9lODpVn34zjFEg0SDmmr4yUi6SDcbud
X-Proofpoint-GUID: f9lODpVn34zjFEg0SDmmr4yUi6SDcbud
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_03,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050070

On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> Inherit C-PHY information from CSIPHY, so we can configure CSID
> properly.
> 
> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>  drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> index 2a1746dcc1c5b..033036ae28a4f 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>  	val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>  	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>  	val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
> +	val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;

This field is 1-wide, this would be neater:

if (csid->phy.cphy)
	val |= BIT(CSI2_RX_CFG0_PHY_TYPE_SEL);

Konrad
