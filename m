Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCEF335BC0
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771329400; cv=none; b=YWKPR4Sa/vn3r2ZVS0ECxPzFupS+SQhiqqIWp4xnrIxIl/oPA/z4KUxaERiVMRS7MN5eEuRmFqO+kXWyucwGGandbmAulZmGJMFkIzuSWR2aHnLwpV56IjYpNgtsFj7aT/W9pnEAcvcn77ArLQjvnSIZFb3Nyk5dDz1ObD++p/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771329400; c=relaxed/simple;
	bh=CfAR57z2aVgzx0jNoBJko0yuCR6WfqzxE0KUwxCbFvg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pCtMCFCm6qMixUbCkXeyIAdYuY+uK9UfbS5Cz9v2e0klQb7vdyhJ5w5gJwT/mMROKps8cbl1xSd+9w7I+JNACuVozWOJeAmnrvFpoIz/QHVkaqnjtgQowdM4HZn4aBzGjoEp3W3yHZkgp24P/Lh7bSt/QLVAxsNRZVw+3Ppdi3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zm3rVc8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOtbN1ps; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zm3rVc8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOtbN1ps"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61H54mZp2112094
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:56:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=; b=Zm3rVc8QPDpY+TZZ
	mx9Ya/bnKHD96jZQGK5eczSQK/o8gIvOYwkjrSY2KkdNxiK/1DPVaUZcU2Wd67X8
	4+QfhNIrp9rykx1aPTurddjDaSTjyAt8EvVxTfl+6NPnEjvaoXvdr6bKA6tvplM5
	gS/PuNDCDzcWVdQb3ZkLZ6i97LU5MM8w86b5TrniPLwYlHcb3kRYw48ipgogMevn
	pZ7o1vxaXjLt8tf1L5QqGgfVeDF04pdc01WEppI12L+rn3HlyRQlbIYZ/6mBOfCT
	9rAbrw6OwAvUMBDasqXfU9AVCFMhIGqXDWBG8EwcPCCZkaLx27mW5anxAkh/byKz
	hfPUvQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cchv4gwtq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 11:56:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3562370038dso3490784a91.3
        for <phone-devel@vger.kernel.org>; Tue, 17 Feb 2026 03:56:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771329398; x=1771934198; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=;
        b=BOtbN1psE/gx/AFwC23yCzFnXNI4UxdfIs3mITGS+c6ZUVPeXI/ly5+kYsUSB9i7SX
         tWaPUgeBSk01mJ9PQw1O/TCB+spWZiyCpWFt7w3kirtjqO2PZLaFoBbWVayH8o9fezoF
         uA+9vTCyN1SsP5hfdtoONYNQfhZz4UYxTVZhZeMLSjnJCKXX83C7+sQ2g9znDSSSjMCh
         SW3Le/X1XFKHYMhu+0MzVxb8VmNvaOnHu0m5KaozuVzfxWHR8nQdPffNRZ+lSipQ1fnH
         8AWj5VFE9E0S2qMEh838qwX9GLV+S1ryPT28OA9e+F2JsW5B7o+6j3YqdUiTcM30EYE/
         s90g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771329398; x=1771934198;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=abZVH24cGewfyKGRj1gUBCi7aVoXPrWtU4+xmjBoHOs=;
        b=uAlYW1KRJCjSyPGvnaOj5YapOPC8UEMq1ESsq4Us3r/rERNg+blztIWC7zSj4v+5fR
         fWa9R7enrCwXjK7Qttw+FtdBOi48y2k3uJNy1yxFRqkfgagiJ6tkvvIz1e8gx7y+e4cM
         ZJnGgfZ/q+3Okees54YSJzivybbSAmPHqRlFrFZfM96EeEytMrG3L+JP0bHpecqGJXxt
         jsoapuOLcN9hNmZSUWXCfg1y2RbM2JYejpSWLVb7z6O021NnTI2Akuy+QYYXAN5lglGH
         zfDPMEQuk4RUsaQsi1+AmAeZuSmWjcxSreh3JHaQ71KLH96B5KQaw1ZAQhZV6W92Lp+K
         DraA==
X-Forwarded-Encrypted: i=1; AJvYcCXUSLJ1x/JNledZ0WJHWB8Nx/NVtFb+rkdJiW0MAJHj6/FvknkK7jEVb0ZvFLqqv/dMnuij5OWR9meY3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7AQHOG/CthAKz3m2j4662SUjAgoMgKGyKop5E9o6UkJijsVPh
	/T+BM/zjf3xsTq28eFzFvg6Nx22uOejlrBKzTo/nT4D9CaEpihyACvgKaLdvheJHN+3MpN00syb
	T9in7GVtvt9veVNaaOlzDi4iclhzSiOYk2JTEsuujW1yLrQZ00z4zWm3ArttY4FPL2A==
X-Gm-Gg: AZuq6aI2dGGdXbbCttcnTKZXUiUhm7YJnRJFnrXsOOPcaYILf8b7LpnmFdID7Bn20YT
	9960aTcI83gKFPfwrZbbxcSMMcvKwUognHMjFMAsXozjZbrXEcjppj8/irRp4Z5WZQDiAmuIglX
	bFsSZcif/bmH5uXHsJYjRTF4bKD1OdoAoUcN3DBuwncIFHLQh43UqGBgKPITa/LqLhvoc8YBkRj
	c+Fr/89JLrBqI/gBBdqRHPA6+NEJFDwt3viKEo8u3JVmltmUuyIsA55ZZQrDCMHaBDegGI04zO7
	68UZ9tO6k1OFS+MbyelkXKNQ1wU+MPxvP4TmLXLbsBUTeOkBrJPBsQ1bcljbhtqT0JbA+Nvigt/
	H5/xbNy0TmOvU0CHH73yj+tqkAathA7mf1NmrVhv2tl94nvAT5g==
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr13377699a91.12.1771329398128;
        Tue, 17 Feb 2026 03:56:38 -0800 (PST)
X-Received: by 2002:a17:90b:35c6:b0:356:23be:7ecb with SMTP id 98e67ed59e1d1-356aabddce6mr13377670a91.12.1771329397655;
        Tue, 17 Feb 2026 03:56:37 -0800 (PST)
Received: from [10.92.215.127] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-356a69b38ddsm10428379a91.0.2026.02.17.03.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Feb 2026 03:56:37 -0800 (PST)
Message-ID: <caa870e2-3795-40bc-9f0e-c93e313c8c6e@oss.qualcomm.com>
Date: Tue, 17 Feb 2026 17:26:10 +0530
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] Add CAMSS support for SM6350
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260213-sm6350-camss-v3-0-30a845b0b7cc@fairphone.com>
 <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <c83ce76a-1c83-40eb-9c67-d26b7e6f68f3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eYAwvrEH c=1 sm=1 tr=0 ts=69945776 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=yXsjsA-mUSMGIjApI5AA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA5OSBTYWx0ZWRfXyV2J2dnLiz4z
 HcwGSkzVxhoRKN4uEI9c8383aBhoagcaQIQM3Dblp7/LE3hW3zI2IVQeVQ5IPjB2rRT4ZVzjr4z
 47w+PPQ7Nq98vT47MNTzpTVeGf9+IhbM96PxNU+krye6NJgdBR3id9jgCGQ/PZ0Lmfj6gKpWWCb
 7DUTUjoaizAg4ATYm1MU6tidAmnAofJi1SRZVo6q9KoaFF0pVCjrVeXgnaof2Osprzge7lOONvB
 SEk0sb2P4O0UhhvhjTsGC50/YjfE94ZFh4jD6zCuJBtYhvzo1A+cu4EePw6iuf6m3AQxrroyk4B
 wktyb8C1E45692/EsZ7vEFnU3/0mUuriGXsxrecjx/VAbd0J8YHwozIm9pK44CkT4pw+EMJYEk2
 V9A7Od95shhUq+uIolXIxCo526tpK/pdd3IghqG1gXITGT23Lxom/vRuhq4oY33ujb/UW9dxtXF
 5KxL29SZJb7/nJBHTig==
X-Proofpoint-GUID: ONXYF-315rOJRgan20LbcazkR9zU-BgD
X-Proofpoint-ORIG-GUID: ONXYF-315rOJRgan20LbcazkR9zU-BgD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170099



On 16-02-2026 04:34 pm, Konrad Dybcio wrote:
> On 2/13/26 2:15 PM, Luca Weiss wrote:
>> Add bindings, driver and dts to support the Camera Subsystem on the
>> SM6350 SoC.
>>
>> These patches were tested on a Fairphone 4 smartphone with WIP sensor
>> drivers (Sony IMX576 and IMX582), the camera pipeline works properly as
>> far as I can tell.
>>
>> Though when stopping the camera stream, the following clock warning
>> appears in dmesg. But it does not interfere with any functionality,
>> starting and stopping the stream works and debugcc is showing 426.4 MHz
>> while the clock is on, and 'off' while it's off.
>>
>> Any suggestion how to fix this, is appreciated.
>>
>> [ 5738.590980] ------------[ cut here ]------------
>> [ 5738.591009] gcc_camera_axi_clk status stuck at 'on'
> 
> FWIW 845 has .halt_check = BRANCH_VOTED here, which translates into
> 'dont check the state at disable', this one has BRANCH_HALT (i.e. spin
> and keep checking the hw state)
> 
> +Taniya would BRANCH_VOTED be fitting for 6350 too? ^
> 

The parent RCG of this clock is under NoC control, and seems like there 
is no vote on the NoC while disabling this clock, hence this issue is 
observed.

The BRANCH_HALT_VOTED/BRANCH_HALT_SKIP should help, or if the NoC voting 
is removed after the clock disable then also this issue should be resolved.

Thanks,
Imran
