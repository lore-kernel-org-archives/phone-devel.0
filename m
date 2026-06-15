Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C4C37DE90
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 12:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781525464; cv=none; b=iVaYJ7rrpPBLJc4XF814SEFOkWUsWGu+GHtq35axoWkKP/N4/as97Juk1PMeqhGig5a0gpRJH5YsX5GN+803ilo4UhWynncsJvF1mnaNZn6QyoEN0yx33s5WmSs+blE6LsTuGIM9HYBy7g1QoMQ4PwiiU9bnUgaenINkN3xnoHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781525464; c=relaxed/simple;
	bh=SYS6DuxvOsAPUHg0CRU/asuNx+GYt1ac6BM2JbjTeFM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QFWmjvRc1SD6zML+MCakaIIdjCV7n/MfIscfV+QLR8iDkDPot8Q7bpod2WasStUdLm3tIH3PAh8vdb5QgrIcsAJFJ9rj2GUZT7xTbuvB9nCJ3n/weWYQTZWheGizUnLG9yOxoKyPd5nbSOgfCBRpTE0+v7QzhpnnISExksD7iF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jbOq5iTV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FlhGUq78; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jbOq5iTV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FlhGUq78"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FAoht63986962
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 12:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+QzD9QjCDgi8m96sISja9Y9G8pf1CyaetmofKENz/yg=; b=jbOq5iTViqae5GaE
	VrWWF275K6FaLgxT0cPSG6lIHscXn36i8CaLzCmAlkF81wUunDEWs8Xq3S80JWCQ
	5x6EXRZJdB4tws19ZVqL/3CRvQ8+zlEpEmHO4hz9V/e3uXplNRGUlFwygqEdw5Zy
	XOUWA5uivmKNSaYFN3D0wKOlOMwQFQUJ6Uszxk7ZKsIseojf+GZ3cTybS35wTFLt
	poDLklPkFgNN6j4iewh7pup70CUPrq0kgg0qGH8dwjG13qtfzziKEau5VC52nZM8
	3zFAyFlhcm9/PwVh6oeocS1oQIU6jYOEc6MzqKhUQyJ84VWXklJJO4Po9zcG6bMc
	DIV/WQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0gjfr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 12:11:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51757324dcdso4474861cf.0
        for <phone-devel@vger.kernel.org>; Mon, 15 Jun 2026 05:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781525462; x=1782130262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+QzD9QjCDgi8m96sISja9Y9G8pf1CyaetmofKENz/yg=;
        b=FlhGUq78Zu57tKx1EOIl+4Rp3a8yeuzL4r+JzQwAkzwPtJYh8pGxuxiSZaH1HyaBbC
         UeXrnuvezEPwkPYVaWJX5vpQX+VJRxXW/J+KZR267D7YdUdtwNo8a54GW4cOJMRrX6qP
         oSBcNkhJAad37CqRUrhvVdJBl9d4owgqSWQ63ew4sfII4abaef+nquCqsTNwaRtxPjx5
         aTT5R+2yN90H4VMYybHyY3880ZzBNFuNXZuv6qqaaENst2Y0oTlOx3FR5L/W2sNiQt3D
         ukZmZi1mnboptE6mwhbA8k2lrD2cyD4SbKEiu6CpsYm6ozYvUNblLg10r+PYdsv2iUvS
         7YFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525462; x=1782130262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzD9QjCDgi8m96sISja9Y9G8pf1CyaetmofKENz/yg=;
        b=Ce270AWvPo/lPtIIaBEhtyqKHCk5RGX1/A8gavEUIoyYQu3P4HtvIUAffn0Q7SCC55
         7mh/SLL7SFr9oXrm/MR5wYSqUFHtewUCmR9Km1osO7UvUuwpPtcOD5wkrfbESDkEUDLr
         S6Z1r+xqe6kX5m/Vm5cd/ghW4eqhdwLAKFlK4zhDkR9NV4Z2b8Q9F62OpXk/bDfC+b5z
         oYDUzFP+rFCpTGc0U3Ol7s69+J47W3EsNb5Ky6q8HkfkdANsVxzXIxVoe0PREAMxlKLz
         DjF8KvP9kfWaHxEkUEKcnNAiQnnN6xKP8suQmaeG6Flk6XmM9Vi6cLsuA9oVR5YK894R
         go+w==
X-Forwarded-Encrypted: i=1; AFNElJ9ry/t2a5tV6fr0o6/0sZ/TS3fNBmzCWB5rZiCfknBzLfgBHO9Ix3E3QaAR9X80SiBliQj7RStVnFlj8A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+pXiRWcs8EfZmpdOinn9oOat3aKsB7Y717/0CIr/lYIpOQ/g
	9aQvjLM+Xw5wMH59q1KOwGy1koYE5yz5R2Clqvg2PjIpTGXXHCOj71twFbTmKGfdlpDJgLOQcE8
	DtMfKJvLLU5wM5I2E4kFjyXCA7zjW5htJRxVg13DQB6cBByB+M8/AMHA0H8ikw3FMfA==
X-Gm-Gg: Acq92OFApsDVdYcojG0ZuiHcLbNs6CYp4AXOYNrianTsnWM4PIx05tIsdw7pfT757BX
	2jMhzp6UAGwgL904UfG6e9GiIHBp5V1CnKc2aPyZpgqHpaBBqi+vPBmnSD1s2tMId/WOoe4xRYZ
	inMjEywbTMaUgCnk+UCsBFqgMP+LP+UBwzQnM3+OZa7hLkwVBK2dEGItZ33g6TJOB8Q73N3htVp
	MG9VIfEeBU6RVG3JFBPLoyETPwUjKmsKmtEMtpUfH/ZseIzTy5VIJfTr45aeLoid3bL3Uvq+2Gl
	zGKuyBI2MT3mJF5CkGaBguuJ+gnDJew3N9mhCq63zIqjIM+478Es9N19zpvXWptjJZ3j5hK/+IS
	YhymevCij77YLhl5xdokfZenRPuZN2nYSISJRE9Vqj9yCPA==
X-Received: by 2002:a05:622a:1b01:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-517fe568e67mr124102771cf.5.1781525461696;
        Mon, 15 Jun 2026 05:11:01 -0700 (PDT)
X-Received: by 2002:a05:622a:1b01:b0:50e:5cc3:6f59 with SMTP id d75a77b69052e-517fe568e67mr124102341cf.5.1781525461225;
        Mon, 15 Jun 2026 05:11:01 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb9013575sm464826866b.59.2026.06.15.05.10.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 05:11:00 -0700 (PDT)
Message-ID: <2f76cb76-9bd8-4f95-b168-1250de12eec0@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 14:10:58 +0200
Precedence: bulk
X-Mailing-List: phone-devel@vger.kernel.org
List-Id: <phone-devel.vger.kernel.org>
List-Subscribe: <mailto:phone-devel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:phone-devel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: kodiak: Add camera mclk pinctrl
 definitions
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260612-kodiak-cam-mclk-v1-0-fd294ff003a2@fairphone.com>
 <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260612-kodiak-cam-mclk-v1-2-fd294ff003a2@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX4gao6wsagKsT
 A0C2eVBQx94JzWWBc9yAXaAbnkj+qi4WHizMxNfTe+VGySl2FV/CPLX9OR1HJixwYbsem8OzCOQ
 Mk3EPHuoKd5tPo2wbEE4HEAqu7WpI2A=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a2febd6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=GC7ltwg7MdDjMvrKfcoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNyBTYWx0ZWRfX/ji5VjB6l/B3
 j1BIhhZ8vYOki3n+5t49Suex/zfajvEA5IZzGHyS8UKMi7zAQ4ax0uwq7aybS+njlRzYdpHGWf6
 831ikfSoup1NJYWl+8uYJk7P9JGOEeOQ32U7CLAq5Ho93ILMN8cyEiemMVb6pqyOb2lDn8NRheF
 J02zTmmGV0BnnTomW3Pc7VQ6x+Ei9ulmSI9Rb0PZ8D/A167ybHJGivw9lLxfEuzOtrSUkpWXujp
 k/y02bZu2KF+oIQrYAz7TRPv8zph7cmqK/EdxpOdGCLmIJViah+6frbySqUKBXpI9HYyOudRWIU
 VaaejAxrH7zPFHu8x8dQ/Jg/bZXK/DB3XHNv56unE0ZoJh0Pg4oL4ZxTvYepXKzQFQziEEoH1PJ
 Cu2YBIM69QAfLbqxQIeu1Jn5ze8H7vQsFo22jVezVSE6iODNb0cFxP8L+fa1sTpZtx5HuyAb7l5
 SxpWCGuR6ia22/4XKEQ==
X-Proofpoint-GUID: GZOEb5Hqb_6A-dt4QWGTmsH9JlTMIm_a
X-Proofpoint-ORIG-GUID: GZOEb5Hqb_6A-dt4QWGTmsH9JlTMIm_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150127

On 6/12/26 12:55 PM, Luca Weiss wrote:
> On different boards the cameras are connected to different pins with the
> cam_mclk function. Add the definitions so that mclk0-5 are covered.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Could you tack on a patch qcs6490-rb3gen2-vision-mezzanine.dtso
to use this common define?

Konrad

