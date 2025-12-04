Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F3233FE01
	for <phone-devel@vger.kernel.org>; Thu,  4 Dec 2025 13:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764854835; cv=none; b=aDyPjLYK3rq1XDqMhQC7I0h32nlidAR5LDSseYJmnncdlDmrZZXULgcRrCO1plECx6T7NA7y6sxqnvVkJkqnNGwgJkBI6yJZqXMh8Y4U+p2QJe2d2VZAXlkLuhetEm/DpMKEuIEEetWhGR/IIERBpUbqWdYj/68LW6GNcVtNWvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764854835; c=relaxed/simple;
	bh=TX2aNn6Txc21R7wkZRHglMy5X17XWRqN8kc9m8eWEl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P5uqt/hkYmci8MKjg0JI4c8SN4DccC2COy3+Nr1hZYXxoTagt5VtEi/bBuYQN7YzSE41qQE06AGUdJpK8vtjgNhwjx/d94cUgRGzaLfVvu9JhnXcx6hq0d5sphPwBVon0nmA1xPnC9bmv925tv5X9BeMZ1Z32wyeKSHFZi2igBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=atdcpNZ7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DiagKW+P; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="atdcpNZ7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DiagKW+P"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4AErx71130941
	for <phone-devel@vger.kernel.org>; Thu, 4 Dec 2025 13:27:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J3BEgiMQNQBWEFBBbvKgKwnhgWUoTYK3fDTHRMW620o=; b=atdcpNZ7ElN5oCUw
	ivDmCWB+Qq0UBG67GdOxXAGrFh0ZXkZZbGxiMZb41K2LKiOzMdo0/8cvySdmtq9k
	Aaa2eChW04GWGi2fnIhO19ro3fCk1XGKPP19BuW7lUPbVwp0nupMbs9iB8LDY6ou
	8SlgPZ1Db0+p/o9O2Om5fEItuB6gHD7kW8l52vUiB7VZuSueyr3XmK+3dRLvDJWB
	WHfQgK6rC/P0mYsyzG0/dQVDahZseqeZXgcNxyOCLwJ9YZ6LznzzBy8StiXI4nas
	Q+LiCKnNmKEg9uKXHNUXvHmOS6sPNTLCdTxSD+VLhxpoFIUL/yxvqaJeDXw0rgU+
	SYRdzw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4au1f01tgv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 13:27:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2e518fb75so6073985a.3
        for <phone-devel@vger.kernel.org>; Thu, 04 Dec 2025 05:27:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764854831; x=1765459631; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3BEgiMQNQBWEFBBbvKgKwnhgWUoTYK3fDTHRMW620o=;
        b=DiagKW+PtwavHKhU9K8Gw3Gp87Bo8xyHHoy/W8V8WtuiGzr//c5MytilOEnUT7snbG
         v1uYUBDF5WFBZHJxMG1uPcj5epJQcKhYQQjpKrQ2TCtqveSGXgRS4+s0DaUgbMAvrjcf
         mbWF9vuG7xDw1ztHXB4P84P5ksF8tVT0uv7c1MnyQMLSnFn61ngfBCmF2eu7rAsrkvQj
         OA94489a9sI3z7GGwgNtaaiM+Tjo3oFAFfpnD20f/Pke95lNUTpMXetdH4BMOUf1/oRs
         IMslk0EFUReus9J62MH5gVdH0glnrC9G/Xfozi4jzHVlSG45uNO+ACcji/7b3WjoP8Sn
         t3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764854831; x=1765459631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J3BEgiMQNQBWEFBBbvKgKwnhgWUoTYK3fDTHRMW620o=;
        b=Zq+cZPC7LNlkkWHRnCUu2MWLRUQ/Xje5DZEIYgh970pl9Qes4VHXlSkqbtcHpszwK8
         RzOdfS5aavpS78Ka3IgSmfBeqxjJRH19ma5WgrbeJbizjTnA5zi1CfBA+hwkyfYFg2XU
         1CxXxBHwMHIOew3bXFZaNdshVjZDzKNSXlpv/Vgg5jFIwHQzQVBXZsoDe3g1bS+i8RAY
         /CqULmsT0z0SuaGdr+hIX1RBdMTPD2znCDC6OkXwb2W/zDqysfpQsRwtuKjyoAK7FvFh
         uAAkNEf7TO9r8X2/2pvcEi3pC50O99SEtXuAVvc6xrDnXm35fcnKvRXs4Ku8HAN0E8Dj
         7N8g==
X-Forwarded-Encrypted: i=1; AJvYcCWG9t02kr+5ct22rTB1M0rIaq0KVHJHZ24oHgb0qBTXHSv75oNp/E4wyCMvgl1MJKlQJ6ZTeIigVCUUAg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzNHyOlDkbKmtFEv8L/l2rdq8uhRmvhxXB7lINo42Of2hq/SOsj
	Sc5+yGiXof48Ti2/VsYxJ8LoQ8k98nWdZVO+qVvfYphk9G/yt4UZDPeQEEV57HyCDGB5lJ6PnBq
	ISP3O9xy4gwxHLf1Z/rX7WlJeVn4RwdA5PNXCmkI5XI0nYacr/0MpQM74bAPU7bjK3wlqpGn9Ww
	==
X-Gm-Gg: ASbGnctEe+Bs/s4+6IMOeRIMyYExBs4gx2n7i/otymEQCrqXIKOG6V0rYhAAQDNbdaD
	HYP8vc3FdvMEHbt1aypNyLceFbl2NpYQKdIVO3Vbv1XLa1s9GbBUVMhSOBn/x13fp5TdJ7oH74U
	oR0/CevwxWdiqboOYiPSyRFi/5kCFEBn5JOR0jt787ibyJDYd4R45kQvZ9Ii9NtN10jUBhvBhpK
	LJQo8IAQ5T3s+KiGXxXKEuJfagSx18jhFvf+RTkj2o5iMj4LWEZgKcdIc1imld5eAgNIvKQXHsp
	78/G9L+FsihxONhXIgl+VmJyoYSvtNVcqvcGSU74zAnHivZ0ok37FOmnJS2+pVuRnNWmMb9TPlJ
	VodLafj6RxU2AU8lc1Wjci/ec6Az777hCsUu1xwe5V2XvF0BUkG69EsInPPcTB2XQYA==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr551524885a.1.1764854831117;
        Thu, 04 Dec 2025 05:27:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGh56UAJuRB86lSXEDyhdK2SsF2SVo4nMmW49ZdAwHGuURV14ptAGvZyHWhSX4g7LeBXYetPA==
X-Received: by 2002:a05:620a:1985:b0:8b1:a4dd:3d66 with SMTP id af79cd13be357-8b5f8bffce1mr551521785a.1.1764854830596;
        Thu, 04 Dec 2025 05:27:10 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b368dcf8sm1271135a12.19.2025.12.04.05.27.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 05:27:10 -0800 (PST)
Message-ID: <1605571d-9199-41f9-9624-305357324b1b@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 14:27:07 +0100
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] arm64: dts: qcom: sdm845-lg-common: Sort nodes
 and properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251203-judyln-dts-v5-0-80c1ffca8487@postmarketos.org>
 <20251203-judyln-dts-v5-1-80c1ffca8487@postmarketos.org>
 <6ebf4056-c6e0-495b-9e67-ca8d9dc8eae3@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6ebf4056-c6e0-495b-9e67-ca8d9dc8eae3@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: imlZCPGcOCX1rKTq5B5uoO6Ki87QZ8T1
X-Proofpoint-ORIG-GUID: imlZCPGcOCX1rKTq5B5uoO6Ki87QZ8T1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDEwOSBTYWx0ZWRfX47LK1hzAwBb1
 08G7QxVSvugcJVK02iT4ChwHgKuxVEAQa0O/JJmvUWvQx/3kRNB6zRoIyNq2FkT56Bnegy/Sbi+
 eNuJE+MkZiDkK+NVvEJYt/gBLUQ6RK8cw6As1gDKltjxodDQvXMTeoxJRxBgxprzUYMsHrP96V9
 h8fcGpo8LhT3cOsjY9YnmmzRnZ9KhysFY8VV0dHr1jwsMtf9QirCSoSgQqscj3q1AbxZ65+zanT
 qs1wy8cBwWFQMNG6PzrIe8/n/N9nw9zj71onQ71dfyrtY5VIU3s1nmJfYr16ZcwAMg1dU5o7TxB
 DOGNqAf72Twt8vUy0UQZhgBcVl58dz0VWxFF4k+9xkEQFZwQUwx9Ca7iDoHUFvW+o55NmC11W1l
 YNLlROw5XHe3P7k2CFk+3kwQaIpqmQ==
X-Authority-Analysis: v=2.4 cv=Scz6t/Ru c=1 sm=1 tr=0 ts=69318c30 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gbw9aFdXAAAA:8
 a=9YTxGxaVBTEbm7DE2cgA:9 a=QEXdDO2ut3YA:10 a=5XHQ0vS7sDUA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512040109

On 12/4/25 2:11 PM, Krzysztof Kozlowski wrote:
> On 03/12/2025 10:40, Paul Sajna wrote:
>> Improve adherance to style guidelines below:
>> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Paul Sajna <sajattack@postmarketos.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi | 144 ++++++++++++++-----------
>>  1 file changed, 82 insertions(+), 62 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>> index 0ee2f4b99fbd..b8ab64a8de1c 100644
>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>> @@ -38,11 +38,6 @@ reserved-memory {
>>  		#size-cells = <2>;
>>  		ranges;
>>  
>> -		qseecom_mem: memory@b2000000 {
>> -			reg = <0 0xb2000000 0 0x1800000>;
>> -			no-map;
>> -		};
>> -
>>  		gpu_mem: memory@8c415000 {
>>  			reg = <0 0x8c415000 0 0x2000>;
>>  			no-map;
>> @@ -99,7 +94,12 @@ memory@9d400000 {
>>  			no-map;
>>  		};
>>  
>> -		rmtfs_mem: rmtfs-region@f0800000 {
> 
> Why?
> 
>> +		qseecom_mem: memory@b2000000 {
>> +			reg = <0 0xb2000000 0 0x1800000>;
>> +			no-map;
>> +		};
>> +
>> +		rmtfs_mem: memory@f0801000 {
> 
> No, you are doing much more then sorting. You are changing names to
> incorrect ones and maybe (tricky to say) change also unit address to
> buggy one.
> 
> @Konrad,
> Why are we started resorting the addresses BEFORE we came up with proper
> linter? Why the rule suddenly changed?

I don't really mind small cleanups that are done as part of bigger
feature additions, as opposed to fixing a single file for the sake
of it

Konrad
