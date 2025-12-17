Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67EA364EBF
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765978287; cv=none; b=Dpy5I5wqIxgx95y6pa+WjlpO2sDZV3tcWnM/6kYD99PierzgHpN6BhOj1XPSwJSvv/8LRsvz2pH66yLSp2s2/W3kNVW3q32J8JgDUtjEfhFThOMCmwOhJ8D2MEgPRVuYqTipUXyQ9OxAvXi/G+T5FlB2zZG3B6tLg28g9wLnZ0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765978287; c=relaxed/simple;
	bh=RBLLRntVZWVpvoCZWnUgVT+GEF3ElFZl4/sQLo2kLZ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dH0ej8mzS0eLwHm04a7SmHU6QOvTLxEErVeH3DEtqBzCgXzFD/0QMQuxd5RyRZ8DfA9yQxayMnhd48CAZ600767xtt+lcg/SuwDfHNwR6QZadN7/RCtgHl2+8+fG3BTS7ZbJze2iHqxiBC2ksSAQo9wUdI8BeAU8I1uYeqv/Bzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X/kSzDD7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvumRo+D; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X/kSzDD7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvumRo+D"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BHCKsf1330772
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:31:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2euulZIF75eNjE+jfDopkk3bG+5t6JFAkFjDEEAd70E=; b=X/kSzDD7wSqN2mt3
	2lHQrnHI0KWleAdNmovA1YZkbw0rCjvlTpg3rEiG3EIyTX4BLXSfGx06vxA3sJGH
	USce/l/UotBZZenv75JqG4E25Zp5vH2vJZ6sOfQNSXaW4odNVahJi1nDIag+NUha
	za2QYgIWPZ7w7gcPyqdGvuneZNx4zwjZDgyjHtKlf7rP2J5cd73GZrB6NBkgtTJa
	I6ETWJvazIc6AETQ2ggJVOg9P/0vU62jfCcmKio5a4UZWIP05Zem1noJfWc2Nq3/
	lDrE1YOhmy4RJItptE+HD6iYsB0VpaOha4H1rcsXg7kXQmtqwL5EolfYUMe9hEQg
	Fx04uQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e0kad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 13:31:23 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-93f52945c5eso277485241.3
        for <phone-devel@vger.kernel.org>; Wed, 17 Dec 2025 05:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765978283; x=1766583083; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2euulZIF75eNjE+jfDopkk3bG+5t6JFAkFjDEEAd70E=;
        b=XvumRo+DmYTPNkUXtNfA7qNOExKOdylzFGbJGgcK+W5DzGeNYGMyfd67j78AFOxl5k
         N/ZRqlnGsvnm7yYgK3WG9ZB9YDNDYY0jjiII/CmEhTp2QCN0iIpZHK613JzeRUEy48Js
         Wp1nhFEKjszJA8e0sYDQZY6gzcMmb4Vot6WTnaZMCgky5J0+OUQVJqZIqWXVb1JQj/BI
         mrKS+24dVdwQk8nHO9EzuUcwCx2LJruEcALNMyVZugW24OCkh51xP/PJhUD7FwG7ozLU
         1/8H7TaYbTlzkp/nVDKXKtVIWSh9q7Lsluhsk+7kWVrpssEekwqzL3jS0PDi031grcGM
         5Dyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765978283; x=1766583083;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2euulZIF75eNjE+jfDopkk3bG+5t6JFAkFjDEEAd70E=;
        b=Y/1+W4o1uWZPGZaP8xLGcAsX+L8/PmUpuIbRFfNsQlMUyOhXvPpO81w9a1eGc9XceJ
         CFrKaQb9OqETFVn9twfyu2W3aypznlipXIuuZXHL5I5pxagcCXks+XYTzWOyzowCpjEL
         4FOFs5j2CxiOO4Dv8KbUUWtWUvsbih4haruz8Bb3r1CEemfRmSeBcnNq6kbc1hBDvZg0
         yz0CQoKhEhusJUS12oA2F/jeRT9zj4Dgo9SOvSlpYER6AuAibuxE10Qyh0egUp+xw2Cd
         Ynmt2BN+kzlLTmdbwHbW/ylKduSMZXXhklgRIYRxjRjgDONBolied2054ooDwOS7aO7r
         8STw==
X-Forwarded-Encrypted: i=1; AJvYcCXgY19PHjkWIuLY+ebf74++AAh0lV6RiKmLP9zaoQmVPJhJnwBUzkdTqz+psKhYlZMq5MqUaBmGHdZ6Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2vk5LeBYsHNrUaVD++UXymWU83YwltCHIBCADv1l1I5Zqeyd
	iJFMFjFjx4m4fWYOmLECQoZ5mzFEJxWQio+MW2DszSsn4LmN3hPTnFiveX0wvERG/1IHsJUB5M8
	WE/9NFJ5vRP8euzHtw06o9Dtya3YuFWKv0dexzKSRfK1V7vhEdLgpmIV80I9mLZ8OVw==
X-Gm-Gg: AY/fxX6RI661JIvWOSO9XdcGnYnlh2S6IEQB9/i/ctSf7E5lYbJe1k1kVCvmEUzgNnj
	Z9RKoMerad+Ab8dEaQ5maxwKZjl9HQDiIzVrCRh1vebaecj8ZdPFydp+730PDdovepV5vj44bpx
	Zb2GRB4s2ppSNfDe7HAOqKBUVIfUkjQ1r1liRizRlmRp/MJ2ceJ1GkBwW6kUy4xUxfp8R6u1I4C
	wqG4vFeoszcmcTNUCrw/CbrF8Kl3yP0fZuD45iyckf5q7JK+zPH6SMM5r3hqkAQGvC17fWJ4SdV
	yg3+P6UsC+W+g0ULMUBN8aI7zmHV0x7yGkgw8ZE1HX0ClmT8HNziR08pxFG5jx4SfdLgfE1QUn5
	TNpxZ7luQv3HXyc/RcHlYBI9rM2G9EY0F1xT9G7oh0Q/bw4guSmcfbjKdDYwC6F0ckg==
X-Received: by 2002:a67:c405:0:b0:5df:af0f:309f with SMTP id ada2fe7eead31-5e82728ab3amr3222785137.0.1765978282868;
        Wed, 17 Dec 2025 05:31:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvnlK6mH5YvpaVoknvDnQ436wUIAdp2dfjCfg72O6QLXAFenjMtzOwBS4IPx0mHAicsrW9gQ==
X-Received: by 2002:a67:c405:0:b0:5df:af0f:309f with SMTP id ada2fe7eead31-5e82728ab3amr3222755137.0.1765978282443;
        Wed, 17 Dec 2025 05:31:22 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b80013c7ea0sm336503166b.65.2025.12.17.05.31.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 05:31:21 -0800 (PST)
Message-ID: <689db2b8-6845-4ac8-a012-e589dc11e45d@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 14:31:18 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH WIP v2 3/8] media: qcom: camss: Prepare CSID for C-PHY
 support
To: David Heidelberg <david@ixit.cz>, Robert Foss <rfoss@kernel.org>,
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
 <9af39b45-581b-4e25-8ab9-19015f00d6bc@oss.qualcomm.com>
 <df5557e2-a086-48ca-b8e7-972cbdb7745a@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <df5557e2-a086-48ca-b8e7-972cbdb7745a@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDEwNSBTYWx0ZWRfX5he4cbNSiFgS
 tGRyGYp7o36OYNdm6x8yoYcng18QdL1xO/4Ikp/c2YunLo4qGYJYtdxHOvhOaEY2ge67DMt1xbC
 QaYvF7irgcLDiJGwTwpWeh0MbmDJNgfF+yAa0S4kb2xDjaopKwmiP/SxizszHvMndTKE8Wb+CA0
 TWgoBy1XMIzyJ/NeAGLRuKLeujmULrYGGFMSLIxgz/9FmE44vDsEqf9Ei5divnqOW/OeZ9zMRvo
 mjsw7BpKeg0aoG/zK5SRjrnL2O/b3Xm5F9MtftQoLY2w8YDlj/jb9XHnEQinmbHGSSxnJEbqFtf
 rQCP2zvj237RsQrCgZxzgWBQqO5/9H+Nnf5XEtYfyaSFY469yDSM+LEgk3kdWBAiNOsGtfsFGK5
 5j8VAJSQaVazANu7AxqApTMP2jdhYQ==
X-Proofpoint-GUID: gbnaHLGvuufMbKVmGtj-lVsMgQ7OCs1U
X-Proofpoint-ORIG-GUID: gbnaHLGvuufMbKVmGtj-lVsMgQ7OCs1U
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=6942b0ac cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pJuDoVvVS2QliF8PZP0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170105

On 12/11/25 4:20 PM, David Heidelberg wrote:
> On 05/12/2025 10:43, Konrad Dybcio wrote:
>> On 12/4/25 5:32 PM, David Heidelberg via B4 Relay wrote:
>>> From: David Heidelberg <david@ixit.cz>
>>>
>>> Inherit C-PHY information from CSIPHY, so we can configure CSID
>>> properly.
>>>
>>> CSI2_RX_CFG0_PHY_TYPE_SEL must be set to 1, when C-PHY mode is used.
>>>
>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>> ---
>>>   drivers/media/platform/qcom/camss/camss-csid-gen2.c | 1 +
>>>   drivers/media/platform/qcom/camss/camss-csid.c      | 1 +
>>>   drivers/media/platform/qcom/camss/camss-csid.h      | 1 +
>>>   3 files changed, 3 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> index 2a1746dcc1c5b..033036ae28a4f 100644
>>> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
>>> @@ -183,6 +183,7 @@ static void __csid_configure_rx(struct csid_device *csid,
>>>       val = (lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
>>>       val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
>>>       val |= phy->csiphy_id << CSI2_RX_CFG0_PHY_NUM_SEL;
>>> +    val |= csid->phy.cphy << CSI2_RX_CFG0_PHY_TYPE_SEL;
>>
>> This field is 1-wide, this would be neater:
>>
>> if (csid->phy.cphy)
>>     val |= BIT(CSI2_RX_CFG0_PHY_TYPE_SEL);
> 
> Hello Konrad,
> 
> while your change make sense as we work with 1-bit.
> On other hand, due to TYPE_SEL naming, it's not very explicit why we set this bit when cphy is on.

This is the actual name of the register field

> 
> Maybe I could propose renaming CSI2_RX_CFG0_PHY_TYPE_SEL to CSI2_RX_CFG0_PHY_TYPE_SEL_CPHY, then setting 1 to it would make sense.
> 
> Most clean solution to me would be something like
> 
> #define TYPE_SEL_DPHY    0
> #define TYPE_SEL_CPHY    1
> 
> val |= (csid->phy.cphy ? TYPE_SEL_CPHY : TYPE_SEL_DPHY) << CSI2_RX_CFG0_PHY_TYPE_SEL
> 
> Do I overthinking this? What do you think?

Perhaps just:

/* Set the PHY_TYPE_SEL bit to enable C-PHY mode */
if (csid->phy.cphy)
	val |= BIT(CSI2_RX_CFG0_PHY_TYPE_SEL);

?

Konrad
