Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCE93876A3
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259783; cv=none; b=pkHc1/8tXqaVjv/ZlCBEErS5f3cwbSeDRP0hXUHOTlr6i7/JeOgB3j7Lx+P/+p3Vmvhhga0Zo7F/vOSSFOxunK5OdM6lcfFJI6DTZGobG+AKkrREX1vOcxXaBrGv8scwQwn4fbjy6H30sPB+BYJZ4jifudxVKrbs7kS5BhOjvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259783; c=relaxed/simple;
	bh=oYni9gC47PxHkEwCBV+JakQe0K5hugq6gJXxrC0XwSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5A116PLhiF2OYWYFtBfty9xctFwYw97AWmppoc27cWzDrDpUYmxDPuDnlfIgPNBxmNVn29+xCqVZ+ylOU5scJIhFJ+NO2WvrIUij/YE1fIyTEYIkTLL+r7drx+Bg1heQP3zRRL+U9jda43iritpleXW8dJQm+6XKS+CHuwKbW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YX9t1XUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP692iWY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YX9t1XUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP692iWY"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7ttLU3468155
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=; b=YX9t1XUJhm0n4Mxb
	G3XgkgHzTVjxIg1TRbOaiK6Vzup6u5FwedFP6vuMuM/7VFHIo5BW3JglpmFfb1jF
	opKCpyQMsIPs5WW3+yCXU1dD/AmWqC+reIZiEU3ApECnHtgDKWit5WXrtF35E+fW
	ZSvLn0Vp2Pt36GV40xsccfM7gvlg3uWu5sh5ZVPdf5RIzJTrYOU0XSavPtSzg7m6
	GuvYKw0c7cnhKqwalanAPwQOYAZJ/dIb3YpaScOh55AyekpPtybgDOM6KesF2j2C
	31b1D0bxbgAc8wfZ9caM2DNDpXrHTu2TPTmtIoBH3WZt+T8ClBWq0AtxObfT4Yy0
	59i7cA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jggej0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b27636835so40752491cf.3
        for <phone-devel@vger.kernel.org>; Mon, 23 Mar 2026 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259780; x=1774864580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=;
        b=KP692iWYQMXhJq1KmcAXmxPmy9P1gszN6npJ6VX/7qEQ1oZP5OXJMGdXD3ccZ5KPz8
         5d4Q6ZWlMaC/BmJIT6Ixi+hoQ64YbQBgU2qreTT2uRfqhC138Nk1nOWc/Z2NmtUM4oK6
         Gy/QC/yF762OLNq6EK8EESI7CRBgB/NXpYJmpEMQYtUBcn0SNBEE6qAe+1URrOVwwLxo
         WIPeDh98UholpTKG1aAE92hPXs+ATiYU4Ux6mhYf3x4lMrGxs2rRZA5Z28e3wA4v2RwG
         vhsSrq0zu8/DhPFIIa+urkG/B0Pbo38erq4m78Fl+8WjLOVKZqfDOy06V1XyS45Gob1O
         0TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259780; x=1774864580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=;
        b=pjZoEm2AhV0nFg0w4mmugGAIINk/94myBGqSjSjHdIJdRYTe+jVh11XaSyaCcCNBLb
         6p17eRGV0S8nohz74ku/o78OVH9o9VOHi+pUrDW9xsFD5y7COQ+7OE4zF/r+IBmAjbXa
         KrrLiMgChcCp80hc5MkHfc5AoI/ubQF7CcgVo+okZjf6gDjfn9Q95uyjMC2+l969r6Kn
         jYFAbWBMbMprV/49tdIzfi0qKWdim6qIcJO7j4KX+cHLYGW7KylSxC9GKxugwSjZyssS
         0pyCrsTClZx1kdrtAiCV2g2S7LOtOcNOwVfA1Fz5CPUpebkTwZjTJYiagUR2uEo8WsqL
         2GWA==
X-Forwarded-Encrypted: i=1; AJvYcCXakft8WrPOK3lfbfziE3amE4y/a0awzjEe+2TdGPf/0qQ3AoydVzwIy98LJtvw7YOHoir/2M59Y2lZaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkKIrKUgTssNMitqZLGami31liBBHhpG4Es22kEG1bkOr45XBj
	52OsYsK3PXBhKht06MWw9JNtkdqHE9SYyznIYGfDqgDgh/bg3yiWj5BaFGfnbcrWCaZCI53h9VY
	ZNgodX6OnJFVYuw1Nk0KA8bFXeyN7mPeAgzx0l1q8Js3928l0QdqbPqLBmLW1EV4nDw==
X-Gm-Gg: ATEYQzyu5eISYgFmxsm5rw6rr1ut7ch8BHkj/i7T2AX9BwHtUkRsFokukMKY8cJulu4
	iL1tIvkI5W1Oq1fio1e4kv3I5HSbasnJP6zuEPsbPPwn7kCA22z11P8mC1zK3Dvs2wHCRZMf7uQ
	aNwZ6H0LyCRj2IcCO1wvTs52IdkueTNcyTq3tEFttconKarB8olrbqPAVXeHMRp2eGURANqN5D9
	YyoheIuMCn/PmJDAkAZgjyII7CBSREeBYJkEd1YQtlf1DIoAVrl3UF6XgqqGsmWPF9Bwhsa5Wig
	kXJ4qWVgjLTHD0AdmHSWFsp2LJSij7wJnWEZPW9FIwNlCOVv81NQTpBZgBU8Fi1Z+zje8+K7bW1
	U95oonzQOq+0UbuSOXWyww3mYd7pkomsRjQt41MXF4ZSYxM+6+QHfxJngU3Axy/StuHPwHFFMJ8
	FZZXQ=
X-Received: by 2002:ac8:424d:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-50b52870762mr43885421cf.6.1774259780184;
        Mon, 23 Mar 2026 02:56:20 -0700 (PDT)
X-Received: by 2002:ac8:424d:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-50b52870762mr43885241cf.6.1774259779795;
        Mon, 23 Mar 2026 02:56:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dbfsm2448274e87.1.2026.03.23.02.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:17 -0700 (PDT)
Message-ID: <182a6226-bb23-4ad6-b454-4913ab461264@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:56:15 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: z4wlBGrTXwC9sRu4_VfcNq042uzuu-Zn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX5hp1sKGXZ23j
 lEeVT4mN2COWd/RSIwlUnfGsfHHeofbHbusdy4+TrA/Og/i1JfRjBiuv5S0Qj9cPJszXMrqY2o+
 XiukX4ecZu4vb/1ldWY9WSCV857uYoC4x0SZCP/KtXoRGzPTkpQJmpYo+ERuKSfR+uH4mxvn/MG
 jK2h4d6enALO4Jvfyhh7PblVJ21It9khVBIiAeYXi1VcoiaahQ9/2fce9auQRzV3suRqhHHmvdm
 2GaJK3SW5FNlmznPvTKlCkUfOi1ZTMjI+ihrFderdG0z9mZtzWnzJ8QZxPWAAzZXU3uPQtoH/T4
 dHj0BBQ/IYtwxesn4B7RKKLPLjG9t/v+/JkjGCngNV4EnhlH5o8V4fYIewF7LTjpUbr0WZZ8tTa
 pokJMaOaL5hPmQdfrlbRbDW3xqtuY+TedL5RFbxDLKrm/yTrtIGKItyivMczY65p4btdE1XgbCt
 LWMqoihjrvsYXpLXXLg==
X-Authority-Analysis: v=2.4 cv=CMInnBrD c=1 sm=1 tr=0 ts=69c10e45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=JQuORDkdG-Em1TT35vkA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: z4wlBGrTXwC9sRu4_VfcNq042uzuu-Zn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Sets a higher rate than the default for good responsiveness of
> touchscreen.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I assume this is in line with downstream (i.e. you're not trying to make
the panel IC work too hard?)

Konrad
